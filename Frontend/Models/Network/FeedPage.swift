//
//  FeedPage.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

/// A representation of a page of posts
struct FeedPage: Decodable, Hashable {
    /// An array of IDs of posts on the page
    let posts: [ID]
    
    /// A unique hash string for the page, used to request the next page from the server
    let hash: String
}
