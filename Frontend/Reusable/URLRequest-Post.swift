//
//  URLRequest-Post.swift
//  Frontend
//
//  Created by Julian Schiavo on 20/11/2020.
//

import Foundation

extension URLRequest {
    /// The name of the HTTP content type header
    static let contentTypeHeader = "Content-Type"
    
    /// The name of the JSON content type
    static let contentTypeJSON = "application/json"
    
    /// The name of the HTTP POST method
    static let postMethod = "POST"
    
    /// Creates a POST URL request with a JSON body
    /// - Parameters:
    ///   - url: The URL for the request
    ///   - body: The body for the request
    /// - Returns: The request
    static func postRequest<T: Encodable>(url: URL, body: T) -> URLRequest {
        let jsonEncoder = JSONEncoder()
        let encodedBody = (try? jsonEncoder.encode(body)) ?? Data()
        print(String(data: encodedBody, encoding: .utf8)!)
        
        var request = URLRequest(url: url)
        request.httpBody = encodedBody
        
        request.httpMethod = Constants.postMethod
        request.addValue(Constants.contentTypeJSON, forHTTPHeaderField: Constants.contentTypeHeader)
        
        return request
    }
}
