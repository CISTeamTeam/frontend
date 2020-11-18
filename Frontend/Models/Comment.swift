//
//  Comment.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

struct Comment: Codable, Hashable, Identifiable {
    let id: UUID
    let authorID: UUID
    let postID: UUID
    
    var text: String
    
    var creationDate = Date()
}
