//
//  AuthRequest.swift
//  Frontend
//
//  Created by Julian Schiavo on 19/11/2020.
//

import Foundation

struct AuthRequest: Encodable, Hashable {
    let id: ID
    
    func encoded() -> Data {
        let encoder = JSONEncoder()
        do {
            return try encoder.encode(self)
        } catch {
            return Data()
        }
    }
}
