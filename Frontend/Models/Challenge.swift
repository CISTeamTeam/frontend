//
//  Comment.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

struct Challenge: Codable, Hashable, Identifiable {
    let id: ID
    
    var name: String
    var rewardPoints: Int
    var description: String
    var endDate: Date
    
    var imageURL: URL
}
