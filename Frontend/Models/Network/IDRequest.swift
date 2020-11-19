//
//  IDRequest.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

struct IDRequest: Encodable {
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
