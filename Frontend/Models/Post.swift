//
//  Post.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

struct Post: Codable, Hashable, Identifiable {
    let id: UUID
    let authorID: UUID
    
    var description: String
    var url: URL
    
    var creationDate = Date()
    
    var comments: [UUID]
}
