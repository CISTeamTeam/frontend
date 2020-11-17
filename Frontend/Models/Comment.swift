//
//  Comment.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

struct Comment: Codable {
    let id: UUID
    let authorID: UUID
    let postID: UUID
    
    let text: String
    
    static var placeholder: Comment {
        Comment(id: UUID(), authorID: UUID(), postID: UUID(), text: "A really cool comment")
    }
}
