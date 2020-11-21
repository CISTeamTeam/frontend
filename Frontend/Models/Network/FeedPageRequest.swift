//
//  FeedPageRequest.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

/// A network request for a page of posts
struct FeedPageRequest: Encodable, Hashable {
    /// A unique hash string for the current page, used to request the next page from the server
    let hash: String?
}
