//
//  Constants.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

enum Constants {
    static let baseURL = URL(string: "https://apple.com")!
    
    // MARK: - URL Requests
    static let contentTypeHeader = "Content-Type"
    static let contentTypeJSON = "application/json"
    static let postMethod = "POST"
    
    static let placeholder = UUID()
    static let placeholders = [UUID(), UUID(), UUID(), UUID()]
}
