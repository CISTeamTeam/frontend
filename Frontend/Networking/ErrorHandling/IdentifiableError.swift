//
//  IdentifiableError.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

typealias AnyIdentifiableError = Error & Identifiable

/// A uniquely identifiable error
struct IdentifiableError: Error, Identifiable {
    /// A unique identifier
    var id: String
    
    /// The underlying error object
    var error: Error
    
    /// Creates a new `IdentifiableError`
    /// - Parameters:
    ///   - underlyingError: The underlying Swift `Error`
    ///   - id: An identifier for the error, optional
    init?(_ underlyingError: Error?, id: String? = nil) {
        guard let error = underlyingError else { return nil }
        
        let nsError = error as NSError
        if let id = id, !id.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            self.id = id
        } else if nsError.domain.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            self.id = UUID().uuidString
        } else {
            self.id = nsError.domain + String(nsError.code)
        }
        
        self.error = error
    }
}

