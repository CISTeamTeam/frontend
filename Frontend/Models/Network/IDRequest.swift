//
//  IDRequest.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

/// A network request that has an ID
struct IDRequest: Encodable, Hashable {
    /// A unique identifier
    let id: ID
    
    /// An optional user ID
    var userID: ID?
}
