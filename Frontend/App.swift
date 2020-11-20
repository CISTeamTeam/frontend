//
//  FrontendApp.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SCSDKLoginKit
import SwiftUI

/// A type representing the app itself
@main struct App: SwiftUI.App {
    /// The contents of the app
    var body: some Scene {
        WindowGroup {
            Base()
                .onOpenURL { url in
                    // Handle Snapchat login callback
                    SCSDKLoginClient.application(UIApplication.shared, open: url, options: nil)
                }
        }
    }
}
