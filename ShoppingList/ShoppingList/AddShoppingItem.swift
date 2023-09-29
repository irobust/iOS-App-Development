//
//  AddShoppingItem.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import SwiftUI
import RealmSwift

struct AddShoppingItem: View {
    @State var name: String = ""
    @State var qty: String = "1"
    @State private var selectedCategory = "electric"
    @ObservedRealmObject var shoppingList: ShoppingList
    
    @Environment(\.dismiss) private var dismiss
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    let categories = ["electric", "fruit", "beverages", "food", "snack", "tool"]
    
    var body: some View {
        VStack{
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(categories, id: \.self){ category in
                    Text(category)
                        .padding()
                        .frame(width: 120)
                        .background(selectedCategory == category ? .orange : .blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.white)
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }.padding(.horizontal)
            
            Form {
                TextField("Name: ", text: $name)
                TextField("Quantity", text: $qty)
                
                Button {
                    let shoppingItem = ShoppingItem()
                    shoppingItem.name = name
                    shoppingItem.qty = Int(qty) ?? 1
                    shoppingItem.category = selectedCategory
                    shoppingItem.isCompleted = false
                    
                    $shoppingList.items.append(shoppingItem)
                    
                    
                    dismiss()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct AddShoppingItem_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingItem(shoppingList: ShoppingList())
    }
}
