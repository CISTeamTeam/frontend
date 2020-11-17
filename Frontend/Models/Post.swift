//
//  Post.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

struct Post: Codable {
    let id: UUID
    let authorID: UUID
    let description: String
    let url: URL
    var creationDate = Date()
    
    static var placeholder: Post {
        Post(id: UUID(), authorID: UUID(), description: "An example post", url: URL(string: "https://i.imgur.com/0loCM3K.jpg")!)
    }
}
