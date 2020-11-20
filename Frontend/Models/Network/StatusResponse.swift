//
//  StatusResponse.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

/// A representation of a network response that either succeeded or failed
struct StatusResponse: Decodable {
    /// A value that represents a success or a failure
    enum Status: String, Decodable {
        case success, failure
    }
    
    /// The result of the request
    var status: Status
}
