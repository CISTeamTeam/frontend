//
//  String-Alphanumeric.swift
//  Frontend
//
//  Created by Julian Schiavo on 20/11/2020.
//

import Foundation

extension String {
    /// A string containing only alphanumeric characters
    var alphanumeric: String {
        self
            .components(separatedBy: CharacterSet.alphanumerics.inverted)
            .joined()
            .lowercased()
    }
}
