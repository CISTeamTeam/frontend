//
//  Discount.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

struct Discount: Codable, Hashable, Identifiable {
    let id: ID
    
    var storeName: String
    var name: String
    var requiredPoints: Int
    var description: String
}
