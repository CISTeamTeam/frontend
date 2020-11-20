//
//  User.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

/// A signed in user
struct User: Codable, Hashable, Identifiable {
    /// The ID of the user
    let id: ID
    
    /// The username for the user
    var username: String
    
    /// The name of the user
    var name: String
    
    /// The biography of the user
    var bio: String
    
    /// A URL to the user's profile picture, if one exists
    var profilePictureURL: URL?
    
    /// An array of IDs of posts posted by the user
    var posts: [ID]
}
