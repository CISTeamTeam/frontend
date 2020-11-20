//
//  Post.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

/// A post, which can contain comments
struct Post: Codable, Hashable, Identifiable {
    /// The ID of the post
    let id: ID
    
    /// The ID of the user who created the post
    let userID: ID
    
    /// The description of the post
    var description: String
    
    /// The URL of the post's image
    var url: URL
    
    /// The creation date of the post
    var creationDate = Date()
    
    /// An array of IDs of comments on the post
    var comments: [ID]
}
