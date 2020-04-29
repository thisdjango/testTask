//
//  Model.swift
//  testTask
//
//  Created by thisdjango on 29.04.2020.
//  Copyright © 2020 thisdjango. All rights reserved.
//

import Foundation

// MARK: - JokesModel
struct NewsModel: Codable {
    let type: String
    let value: [Value]
}

// MARK: - Value
struct Value: Codable {
    let id: Int
    let joke: String
    let categories: [Category]
}

enum Category: String, Codable {
    case explicit = "explicit"
    case nerdy = "nerdy"
}
