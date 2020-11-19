//
//  User.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

struct User: Codable, Hashable, Identifiable {
    let id: ID
    
    var username: String
    var name: String
    var bio: String
    
    var profilePictureURL: URL?
    
    var posts: [ID]
}
