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
    
    /// An authentication status
    enum Status {
        case ready
        case loading
        case signUpRequired(id: ID)
    }
    
    /// Whether authentication is in progress
    @Published var isLoading = false
    
    /// A user ID to use to create a new user
    @Published var signUpUserID: ID?
    
    /// An error, if one occurred
    @Published var error: IdentifiableError?
    
    /// A set of tasks
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Status
    
    /// Sets the authentication status
    /// - Parameter status: The new authentication status
    private func setStatus(_ status: Status) {
        DispatchQueue.main.async {
            withAnimation {
                switch status {
                case .ready:
                    self.isLoading = false
                case .loading:
                    self.isLoading = true
                case let .signUpRequired(id: id):
                    self.isLoading = false
                    self.signUpUserID = id
                }
            }
        }
    }
    
    // MARK: - Server Auth
    
    /// Attempts to authenticate a user with a user ID
    /// - Parameter id: The user's ID
    private func authenticate(id: String) {
        setStatus(.loading)
        
        let request = createAuthRequest(id: id)
        URLSession.shared
            .dataTaskPublisher(for: request)
            .retry(1)
            .map {
                $0.data
            }
            .decode(type: StatusResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.catchCompletionError(completion)
            } receiveValue: { status in
                switch status {
                case .success:
                    self.setStatus(.ready)
                case .failure:
                    self.setStatus(.signUpRequired(id: id))
                }
            }
            .store(in: &cancellables)
    }
    
    /// Creates a URL request to authenticate a user
    /// - Parameter id: The user's ID
    /// - Returns: A `URLRequest`
    private func createAuthRequest(id: ID) -> URLRequest {
        let endpoint = "authenticate"
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        let authRequest = AuthRequest(id: id)
        
        var request = URLRequest(url: url)
        request.httpBody = authRequest.encoded()
        print(String(data: request.httpBody!, encoding: .utf8)!)
        
        request.httpMethod = Constants.postMethod
        request.addValue(Constants.contentTypeJSON, forHTTPHeaderField: Constants.contentTypeHeader)
        print(request.description)
        return request
    }
    
    private func login(id: ID) {
        
    }
    
    
    
    // MARK: - Snapchat
    
    /// The query used to fetch user data from Snapchat
    private let snapchatQuery = "{me{displayName, bitmoji{avatar}, externalId}}"
    
    /// Internal variables used to fetch data from Snapchat
    private let snapchatVariables = ["page": "bitmoji"]
    
    /// Starts authenticating via the Snapchat app
    func startWithSnapchat() {
        setStatus(.loading)
        
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
        
        let bitmojiAvatarURL = getBitmojiAvatarURL(from: user)
        
        authenticate(id: externalID)
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
        catchError(error)
        setStatus(.ready)
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
