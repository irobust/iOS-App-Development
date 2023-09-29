//
//  AddShoppingList.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import SwiftUI
import RealmSwift

struct AddShoppingList: View {
    @State var title = ""
    @State var address = ""
    
    @Environment(\.dismiss) private var dismiss
    @ObservedResults(ShoppingList.self) var shoppingLists
    
    var body: some View {
        Form {
            TextField("Title: ", text: $title)
            TextField("Address: ", text: $address)
            
            Button {
                // action
                let shoppingList = ShoppingList()
                shoppingList.title = title
                shoppingList.address = address
                $shoppingLists.append(shoppingList)
                
                dismiss()
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
            }
            .padding(.top)
        }
        
        .navigationTitle("New Item")
    }
}

struct AddShoppingList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddShoppingList()
        }
    }
}
