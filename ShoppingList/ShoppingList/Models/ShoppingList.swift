//
//  ShoppingList.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import Foundation
import RealmSwift

class ShoppingList: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var address: String
    
    @Persisted var items: List<ShoppingItem> = List<ShoppingItem>()
}
