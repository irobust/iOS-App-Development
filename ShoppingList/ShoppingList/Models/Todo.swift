//
//  Todo.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import Foundation
struct TodoElement: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

typealias Todo = [TodoElement]
