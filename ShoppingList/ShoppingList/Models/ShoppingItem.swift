//
//  ShoppingItem.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import Foundation
import RealmSwift

class ShoppingItem: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var qty: Int
    @Persisted var isCompleted: Bool
    @Persisted var category: String
}
