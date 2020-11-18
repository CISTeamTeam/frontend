//
//  User.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

struct User: Codable {
    let id: UUID
    
    let username: String
    let name: String
    let bio: String
    
    let profilePictureURL: URL
    
    var followers = [UUID]()
    var following = [UUID]()
    var posts = [UUID]()
    
    static var placeholder: User {
        User(id: UUID(), username: "@user", name: "User Name", bio: "Some biography all about me", profilePictureURL: URL(string: "https://i.imgur.com/0loCM3K.jpg")!, posts: Constants.placeholders)
    }
}
