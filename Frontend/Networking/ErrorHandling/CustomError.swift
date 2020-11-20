//
//  CustomError.swift
//  Frontend
//
//  Created by Julian Schiavo on 20/11/2020.
//

import Foundation

struct CustomError: LocalizedError, Equatable {
    var description: String?
    var errorDescription: String? { description }
}
