//
//  ShoppingListApp.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import SwiftUI

@main
struct ShoppingListApp: App {
    var body: some Scene {
        WindowGroup {
            let _ = Migrator()
            Todos()
        }
    }
}
