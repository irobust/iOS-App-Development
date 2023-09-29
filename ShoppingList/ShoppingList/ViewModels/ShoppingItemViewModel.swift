//
//  ShoppingItemViewModel.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import Foundation
import RealmSwift

@MainActor
class ShoppingItemViewModel: ObservableObject {
    private(set) var realm: Realm?
    @Published private(set) var shoppingItem: [ShoppingItem] = []
    
    init(){
        openRealm()
    }
    
    func openRealm(){
        do {
            let config = Realm.Configuration(schemaVersion: 2)
            
            Realm.Configuration.defaultConfiguration = config
            realm = try Realm()
        } catch {
            print(error)
        }
    }
    
    func updateShoppingItem(id: ObjectId){
        if let localRealm = realm {
            let item = localRealm.objects(ShoppingItem.self)
                            .filter("id == %@", id)
            try! localRealm.write{
                item[0].isCompleted = true
            }
        }
    }
}
    
    
