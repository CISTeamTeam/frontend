//
//  UserPoints.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

/// A simple structure representing how many points a user has
struct UserPoints: Codable, Hashable, Identifiable {
    /// The ID of the user
    let id: ID
    
    /// The amount of points the user has
    let points: Int
}
