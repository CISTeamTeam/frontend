//
//  Constants.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

enum Constants {
    static let baseURL = URL(string: "http://fatbu.dynu.net:8000")!
    
    // MARK: - URL Requests
    static let contentTypeHeader = "Content-Type"
    static let contentTypeJSON = "application/json"
    static let postMethod = "POST"
}
