//
//  FeedPage.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

struct FeedPage: Decodable, Hashable {
    let posts: [UUID]
    let hash: String
}

