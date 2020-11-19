//
//  FrontendApp.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SCSDKLoginKit
import SwiftUI

@main
struct App: SwiftUI.App {
    init() {
    }
    
    var body: some Scene {
        WindowGroup {
            Base()
                .onOpenURL { url in
                    SCSDKLoginClient.application(UIApplication.shared, open: url, options: nil)
                }
        }
    }
}
