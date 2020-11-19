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

class AuthController: ObservableObject, ThrowsErrors {
    
    enum Status {
        case ready
        case authenticating
        case signingUp
    }
    
    @Published var status = Status.ready
    @Published var isLoading = false
    @Published var error: IdentifiableError?
    
    private var cancellables = Set<AnyCancellable>()
    
    private func setStatus(_ status: Status) {
        DispatchQueue.main.async {
            withAnimation {
                self.status = status
                self.isLoading = status == .authenticating
            }
        }
    }
    
    // MARK: - Server Auth
    
    private func authenticate(_ id: UUID) {
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
                return
            }
            .store(in: &cancellables)
    }
    
    private func createAuthRequest(id: UUID) -> URLRequest {
        let endpoint = "authenticate"
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        
        let authRequest = AuthRequest(id: id)
        
        var request = URLRequest(url: url)
        request.httpBody = authRequest.encoded()
        
        request.httpMethod = Constants.postMethod
        request.addValue(Constants.contentTypeJSON, forHTTPHeaderField: Constants.contentTypeHeader)
        
        return request
    }
    
    // MARK: - Snapchat
    
    private let graphQLQuery = "{me{displayName, bitmoji{avatar}, externalId}}"
    private let variables = ["page": "bitmoji"]
    
    func startWithSnapchat() {
        setStatus(.authenticating)
        
        SCSDKLoginClient.login(from: presentingViewController) { wasSuccessful, error in
            guard wasSuccessful, error == nil else {
                self.catchError(error)
                return
            }
            
            SCSDKLoginClient.fetchUserData(withQuery: self.graphQLQuery, variables: self.variables, success: self.snapchatFetchHandler, failure: self.snapchatFailureHandler)
        }
    }
    
    private func snapchatFetchHandler(resources: [AnyHashable: Any]?) {
        guard let resources = resources,
              let data = resources["data"] as? [String: Any],
              let user = data["me"] as? [String: Any],
              let displayName = user["displayName"] as? String,
              let externalID = user["externalId"] as? String
        else {
            return
        }
        
        let bitmojiAvatarURL = getBitmojiAvatarURL(from: user)
        
        // sign in
    }
    
    private func getBitmojiAvatarURL(from userObject: [String: Any]) -> URL? {
        guard let bitmoji = userObject["bitmoji"] as? [String: Any],
              let avatarURLString = bitmoji["avatar"] as? String else {
            return nil
        }
        return URL(string: avatarURLString)
    }
    
    private func snapchatFailureHandler(error: Error?, isUserLoggedOut: Bool) {
        DispatchQueue.main.async {
            self.catchError(error)
            self.setStatus(.ready)
        }
    }
    
    // MARK: - UIKit Integration
    
    private var presentationAnchor: UIWindow {
        UIApplication.shared.keyWindow ?? UIWindow()
    }
    
    private var presentingViewController: UIViewController {
        presentationAnchor.rootViewController ?? UIViewController()
    }
    
    // MARK: - Singleton
    
    private init() { }
    
    static let shared = AuthController()
}
