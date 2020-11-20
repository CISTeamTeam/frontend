//
//  EmptyRequest.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

/// An empty network request
struct EmptyRequest: Codable {
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
