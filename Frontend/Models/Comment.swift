//
//  Comment.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

struct Comment: Codable, Hashable, Identifiable {
    let id: ID
    let authorID: ID
    let postID: ID
    
    var text: String
    
    var creationDate = Date()
}
