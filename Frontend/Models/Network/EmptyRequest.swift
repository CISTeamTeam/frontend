//
//  EmptyRequest.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

struct EmptyRequest: Codable {
    func encoded() -> Data {
        let encoder = JSONEncoder()
        do {
            return try encoder.encode(self)
        } catch {
            return Data()
        }
    }
}
