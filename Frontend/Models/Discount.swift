//
//  Discount.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

/// A discount which can be redeemed using earned points
struct Discount: Codable, Hashable, Identifiable {
    /// The ID of the discount
    let id: ID
    
    /// The name of the store offering the discount
    var storeName: String
    
    /// The name of the discount
    var name: String
    
    /// The amount of posts required to redeem the discount
    var requiredPoints: Int
    
    /// The description of the discount
    var description: String
}
