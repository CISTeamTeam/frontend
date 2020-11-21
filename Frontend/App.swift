//
//  App.swift
//  Frontend
//

import GoogleSignIn
import SCSDKLoginKit
import SwiftUI

/// A type representing the app itself
@main struct App: SwiftUI.App {
    /// Configure Google SDK
    init() {
        GIDSignIn.sharedInstance().clientID = Keys.googleClientID
        GIDSignIn.sharedInstance().delegate = AuthController.shared
        GIDSignIn.sharedInstance()?.shouldFetchBasicProfile = true
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
    /// The contents of the app
    var body: some Scene {
        WindowGroup {
            Base()
                .ignoresSafeArea(.keyboard, edges: .all)
                .onOpenURL { url in
                    // Handle Google login callback
                    GIDSignIn.sharedInstance().handle(url)
                    // Handle Snapchat login callback
                    SCSDKLoginClient.application(UIApplication.shared, open: url, options: nil)
                }
        }
    }
}
