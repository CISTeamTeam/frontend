//
//  JSONDecoder-Shared.swift
//  Frontend
//
//  Created by Julian Schiavo on 21/11/2020.
//

import Foundation

extension JSONDecoder {
    /// A `JSONEncoder` that uses a custom date decoding strategy matching the server
    static let `default`: JSONDecoder = {
        var encoder = JSONDecoder()
        encoder.dateDecodingStrategy = .secondsSince1970
        return encoder
    }()
}
