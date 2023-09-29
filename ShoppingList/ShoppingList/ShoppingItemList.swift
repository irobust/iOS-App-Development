//
//  ShoppingItemList.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import SwiftUI
import RealmSwift

struct ShoppingItemList: View {
    @State private var isAddPreseneted = false
    @ObservedRealmObject var shoppingList: ShoppingList
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(shoppingList.items) { item in
                        ShoppingItemCell(name: item.name, shoppingItem: item)
                    }
                }
                Spacer()
                .navigationTitle(shoppingList.title)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        isAddPreseneted = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            .sheet(isPresented: $isAddPreseneted) {
                AddShoppingItem(shoppingList: shoppingList)
            }
        }
    }
}

struct ShoppingItemCell: View {
    var name: String
    @ObservedRealmObject var shoppingItem: ShoppingItem
    
    @StateObject var shoppingItemViewModel = ShoppingItemViewModel()
    
    @State private var isCompleted = false
    var body: some View {
        HStack{
            Image(systemName: shoppingItem.isCompleted ? "checkmark.circle": "circle")
            Text(name)
        }.onTapGesture {
            isCompleted = true
            
            shoppingItemViewModel.updateShoppingItem(id: shoppingItem.id)
        }
    }
}

struct ShoppingItemList_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingItemList(shoppingList: ShoppingList())
    }
}
