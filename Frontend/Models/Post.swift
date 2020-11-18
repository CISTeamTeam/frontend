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
    let description: String
    let url: URL
    var creationDate = Date()
    
    static var placeholder: Post {
        Post(id: Constants.placeholder, authorID: Constants.placeholder, description: "An example post", url: URL(string: "https://i.imgur.com/0loCM3K.jpg")!)
    }
    
    static var placeholders: Set<Post> {
        [
            Post(id: Constants.placeholders[0], authorID: Constants.placeholder, description: "An example post", url: URL(string: "https://i.imgur.com/0loCM3K.jpg")!),
            Post(id: Constants.placeholders[1], authorID: Constants.placeholder, description: "An example post", url: URL(string: "https://i.imgur.com/0loCM3K.jpg")!),
            Post(id: Constants.placeholders[2], authorID: Constants.placeholder, description: "An example post", url: URL(string: "https://i.imgur.com/0loCM3K.jpg")!),
            Post(id: Constants.placeholders[3], authorID: Constants.placeholder, description: "An example post", url: URL(string: "https://i.imgur.com/0loCM3K.jpg")!)
        ]
    }
}
