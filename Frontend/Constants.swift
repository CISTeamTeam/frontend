//
//  Constants.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

/// Constants for the app
enum Constants {
    static let baseURL = URL(string: "https://70fe18a0bc23.ngrok.io")!
    
    /// The name of the `UserDefaults` key for the currently signed in user
    static let signedInUserIDKey = "signedInUserID"
    
    // MARK: - URL Requests
    static let contentTypeHeader = "Content-Type"
    static let contentTypeJSON = "application/json"
    static let postMethod = "POST"
}
