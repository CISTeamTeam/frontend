//
//  IDRequest.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

/// A network request that has an ID
struct IDRequest: Encodable {
    /// A unique identifier
    let id: ID
    
    /// A JSON representation of the request
    /// - Returns: The JSON representation
    func encoded() -> Data {
        let encoder = JSONEncoder()
        do {
            return try encoder.encode(self)
        } catch {
            return Data()
        }
    }
}
