//
//  Error-Description.swift
//  Frontend
//
//  Created by Julian Schiavo on 20/11/2020.
//

import Foundation

extension Error {
    var nsError: NSError {
        self as NSError
    }
    
    var userVisibleTitle: String {
        nsError.localizedFailureReason ?? "An error occurred"
    }
    
    var userVisibleDescription: String? {
        nsErrorDescription ?? "Sorry about that - an unknown error occurred."
    }
    
    private var nsErrorDescription: String? {
        guard !nsError.localizedDescription.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return nil }
        return nsError.localizedDescription
    }
    
    var userVisibleRecoverySuggestion: String? {
        nsErrorRecoverySuggestion ?? "Please try again later."
    }
    
    private var nsErrorRecoverySuggestion: String? {
        guard let suggestion = nsError.localizedRecoverySuggestion,
              !suggestion.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return nil }
        return nsError.localizedRecoverySuggestion
    }
    
    var userVisibleOverallDescription: String {
        [userVisibleDescription, userVisibleRecoverySuggestion].compactMap { $0 }.joined(separator: " ")
    }
}
