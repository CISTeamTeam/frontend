//
//  Comment.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

/// A comment
struct Comment: Codable, Hashable, Identifiable {
    /// The ID of the comment
    let id: ID
    
    /// The ID of the user who posted the comment
    let userID: ID
    
    /// The ID of the post on which the comment was made
    let postID: ID
    
    /// The comment text
    var text: String
    
    /// The creation date of the comment
    var creationDate = Date()
}
