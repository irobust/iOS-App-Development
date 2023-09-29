//
//  ContentView.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @State var isAddPresented = false
    @ObservedResults(ShoppingList.self) var shoppingLists
    
    var body: some View {
        NavigationView {
            VStack {
                
                if shoppingLists.isEmpty {
                    Text("No item in shopping list")
                }
                
                List{
                    ForEach(shoppingLists) { shoppingList in
                        NavigationLink(destination: ShoppingItemList(shoppingList: shoppingList)){
                            ShoppingListCell(title: shoppingList.title, address: shoppingList.address)
                        }
                    }
                    
                    .onDelete(perform: $shoppingLists.remove)
                }
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isAddPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddPresented) {
                AddShoppingList()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
