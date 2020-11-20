//
//  Comment.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

/// A challenge which awards points to the user upon completion
struct Challenge: Codable, Hashable, Identifiable {
    /// The ID of the challenge
    let id: ID
    
    /// The name of the challenge
    var name: String
    
    /// The amount of points rewarded for completing the challenge
    var rewardPoints: Int
    
    /// The description of the challenge
    var description: String
    
    /// The date that the challenge ends
    var endDate: Date
    
    /// The URL of an image for the challenge, if one exists
    var imageURL: URL
}
