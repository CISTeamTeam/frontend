//
//  ErrorResponse.swift
//  Frontend
//
//  Created by Julian Schiavo on 21/11/2020.
//

import Foundation

/// A network response indicating an error
struct ErrorResponse: Decodable {
    /// The error that occurred
    let error: String
}
