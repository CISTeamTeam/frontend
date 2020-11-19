//
//  FeedPageRequest.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

struct FeedPageRequest: Encodable, Hashable {
    let userID: ID?
    let hash: String?
    
    func encoded() -> Data {
        let encoder = JSONEncoder()
        do {
            return try encoder.encode(self)
        } catch {
            return Data()
        }
    }
}
