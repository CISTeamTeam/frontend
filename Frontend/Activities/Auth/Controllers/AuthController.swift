//
//  AuthController.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import AuthenticationServices
import Combine
import SCSDKLoginKit
import SwiftUI
import UIKit

/// A controller that handles authentication
class AuthController: ObservableObject, ThrowsErrors {
    
    /// Whether authentication is in progress
    @Published var isLoading = false
    
    /// An error, if one occurred
    @Published var error: IdentifiableError?
    
    /// A set of tasks
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Status
    
    /// Sets whether authentication is in progress
    /// - Parameter status: Whether authentication is in progress
    private func setIsLoading(_ isLoading: Bool) {
        DispatchQueue.main.async {
            withAnimation {
                self.isLoading = isLoading
            }
        }
    }
    
    // MARK: - Server Auth
    
    /// Attempts to authenticate a user with a user ID
    /// - Parameter id: The ID of the user
    private func authenticate(id: String, signUpHandler: @escaping () -> Void) {
        setIsLoading(true)
        
        let request = createAuthRequest(id: id)
        URLSession.shared
            .dataTaskPublisher(for: request)
            .retry(1)
            .map {
                print(String(data: $0.data, encoding: .utf8)!)
                return $0.data
            }
            .decode(type: StatusResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.catchCompletionError(completion)
            } receiveValue: { status in
                switch status.status {
                case .success:
                    UserDefaults.standard.set(id, forKey: Constants.signedInUserIDKey)
                    self.setIsLoading(false)
                case .failure:
                    signUpHandler()
                }
            }
            .store(in: &cancellables)
    }
    
    /// Creates a URL request to authenticate a user
    /// - Parameter id: The ID of the user
    /// - Returns: The request
    private func createAuthRequest(id: ID) -> URLRequest {
        let endpoint = "authenticate"
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        
        let authRequest = IDRequest(id: id)
        return URLRequest.postRequest(url: url, body: authRequest)
    }
    
    /// Signs up and creates a new user
    /// - Parameters:
    ///   - id: The ID of the new user
    ///   - username: The username for the user
    ///   - name: The name of the user
    ///   - profilePictureURL: An optional URL of a profile picture for the user
    func signUp(id: String, username: String, name: String, profilePictureURL: URL?) {
        self.setIsLoading(true)
        
        let user = User(id: id, username: username, name: name, bio: "", profilePictureURL: profilePictureURL, posts: [])
        let request = createSignUpRequest(user: user)
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .retry(1)
            .map {
                print(String(data: $0.data, encoding: .utf8)!)
                return $0.data
            }
            .decode(type: StatusResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.catchCompletionError(completion)
            } receiveValue: { status in
                self.setIsLoading(false)
                switch status.status {
                case .success:
                    UserDefaults.standard.set(id, forKey: Constants.signedInUserIDKey)
                case .failure:
                    // catch error
                    return
                }
            }
            .store(in: &cancellables)
    }
    
    /// Creates a URL request to sign up
    /// - Parameter user: The user to sign up
    /// - Returns: The request
    private func createSignUpRequest(user: User) -> URLRequest {
        let endpoint = "createUser"
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        return URLRequest.postRequest(url: url, body: user)
    }
    
    // MARK: - Apple
    
    /// Starts authenticating with Apple
    /// - Parameter request: A SIWA request
    func startWithApple(request: ASAuthorizationAppleIDRequest) {
        setIsLoading(true)
        request.requestedScopes = [.fullName, .email]
    }
    
    /// Called when Sign in with Apple completes successfully
    /// - Parameter authorization: An auth authorization containing a credential
    func appleAuthCompleted(with authorization: ASAuthorization) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            // catch error
            return
        }
        
        let id = credential.user
        
        var displayName: String?
        if let nameComponents = credential.fullName {
            let nameFormatter = PersonNameComponentsFormatter()
            displayName = nameFormatter.string(from: nameComponents)
        }
        
        authenticate(id: id) { [self] in
            guard let name = displayName else {
                // catch error
                return
            }
            let username = name.alphanumeric
            signUp(id: id, username: username, name: name, profilePictureURL: nil)
        }
    }
    
    /// Called when Sign in with Apple fails
    /// - Parameter error: The error that occurred
    func appleAuthFailed(with error: Error) {
        setIsLoading(false)
        catchError(error)
    }
    
    // MARK: - Snapchat
    
    /// The query used to fetch user data from Snapchat
    private let snapchatQuery = "{me{displayName, bitmoji{avatar}, externalId}}"
    
    /// Internal variables used to fetch data from Snapchat
    private let snapchatVariables = ["page": "bitmoji"]
    
    /// Starts authenticating via the Snapchat app
    func startWithSnapchat() {
        setIsLoading(true)
        
        SCSDKLoginClient.login(from: presentingViewController) { wasSuccessful, error in
            guard wasSuccessful, error == nil else {
                self.catchError(error)
                return
            }
            
            SCSDKLoginClient.fetchUserData(withQuery: self.snapchatQuery, variables: self.snapchatVariables, success: self.snapchatFetchCompleted, failure: self.snapchatFetchFailed)
        }
    }
    
    /// Called when user data is successfully fetched from the Snapchat API
    /// - Parameter resources: A dictionary of user data
    private func snapchatFetchCompleted(resources: [AnyHashable: Any]?) {
        guard let resources = resources,
              let data = resources["data"] as? [String: Any],
              let user = data["me"] as? [String: Any],
              let displayName = user["displayName"] as? String,
              let externalID = user["externalId"] as? String
        else {
            return
        }
        
        authenticate(id: externalID) {
            let username = displayName.alphanumeric
            let bitmojiAvatarURL = self.getBitmojiAvatarURL(from: user)
            self.signUp(id: externalID, username: username, name: displayName, profilePictureURL: bitmojiAvatarURL)
        }
    }
    
    /// Attempts to get a user's Bitmoji (Memoji) profile picture from Snapchat user data
    /// - Parameter userObject: A dictionary of user data
    /// - Returns: If successful, the URL to the user's profile picture
    private func getBitmojiAvatarURL(from userObject: [String: Any]) -> URL? {
        guard let bitmoji = userObject["bitmoji"] as? [String: Any],
              let avatarURLString = bitmoji["avatar"] as? String else {
            return nil
        }
        return URL(string: avatarURLString)
    }
    
    /// Called when fetching user data from Snapchat fails
    /// - Parameters:
    ///   - error: An error, if one occurred
    ///   - isUserLoggedOut: Whether the user has been logged out
    private func snapchatFetchFailed(error: Error?, isUserLoggedOut: Bool) {
        setIsLoading(false)
        catchError(error)
    }
    
    // MARK: - UIKit Integration
    
    /// The anchor on which to present login UI
    private var presentationAnchor: UIWindow {
        UIApplication.shared.keyWindow ?? UIWindow()
    }
    
    /// The view controller on which to present login UI
    private var presentingViewController: UIViewController {
        presentationAnchor.rootViewController ?? UIViewController()
    }
    
    // MARK: - Singleton
    
    private init() { }
    
    static let shared = AuthController()
}
