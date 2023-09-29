//
//  Migrator.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import Foundation
import RealmSwift

class Migrator{
    init(){
        updateSchema()
    }
    
    func updateSchema(){
        let config = Realm.Configuration(schemaVersion: 2) {migration,oldSchemaVersion in
            if oldSchemaVersion < 1 {
                migration.enumerateObjects(ofType: ShoppingList.className()){ _ ,newObject in
                    newObject!["items"] = List<ShoppingItem>()
                }
            }
            
            if oldSchemaVersion < 2 {
                migration.enumerateObjects(ofType: ShoppingItem.className()){ _, newObject in
                    newObject!["category"] = "electric"
                    newObject!["isCompleted"] = false
                }
            }
        }
        
        Realm.Configuration.defaultConfiguration = config
        let _ = try! Realm()
    }
}
