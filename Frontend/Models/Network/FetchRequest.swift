//
//  FetchRequest.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

struct FetchRequest: Encodable {
    var id: UUID
    
    func encoded() -> Data {
        let encoder = JSONEncoder()
        do {
            return try encoder.encode(self)
        } catch {
            return Data()
        }
    }
}
