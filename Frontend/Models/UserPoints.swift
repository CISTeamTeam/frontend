//
//  UserPoints.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Foundation

struct UserPoints: Codable, Hashable, Identifiable {
    let id: UUID
    let points: Int
}
