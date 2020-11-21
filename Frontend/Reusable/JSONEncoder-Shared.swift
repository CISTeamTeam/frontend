//
//  JSONEncoder-Shared.swift
//  Frontend
//
//  Created by Julian Schiavo on 21/11/2020.
//

import Foundation

extension JSONEncoder {
    /// A `JSONEncoder` that uses a custom date encoding strategy matching the server
    static let `default`: JSONEncoder = {
        var encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        return encoder
    }()
}
