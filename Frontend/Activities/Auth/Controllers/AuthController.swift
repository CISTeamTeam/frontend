//
//  AuthController.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import AuthenticationServices
import SCSDKLoginKit
import SwiftUI
import UIKit

class AuthController: ObservableObject, ThrowsErrors {
    
    @Published var isAuthenticating = false
    @Published var error: IdentifiableError?
    
    private func setIsAuthenticating(_ isAuthenticating: Bool) {
        DispatchQueue.main.async {
            withAnimation {
                self.isAuthenticating = isAuthenticating
            }
        }
    }
    
    // MARK: - Snapchat
    
    private let graphQLQuery = "{me{displayName, bitmoji{avatar}, externalId}}"
    private let variables = ["page": "bitmoji"]
    
    func startWithSnapchat() {
        setIsAuthenticating(true)
        
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
            self.setIsAuthenticating(false)
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
