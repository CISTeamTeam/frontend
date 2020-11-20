//
//  PostRating.swift
//  Frontend
//
//  Created by Julian Schiavo on 20/11/2020.
//

import Foundation

/// A representation of a post rating
struct PostRating: Encodable, Hashable {
    /// The ID of the post
    let id: ID
    
    /// The ID of the user who is rating the post
    let userID: ID
    
    /// The rating
    let rating: Int
}
