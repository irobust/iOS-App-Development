//
//  ShoppingListCell.swift
//  ShoppingList
//
//  Created by Phanupong Permpimol on 29/9/2566 BE.
//

import SwiftUI

struct ShoppingListCell: View {
    var title: String
    var address: String
    var body: some View {
        HStack(){
            Image(systemName: "circle.fill")
                .foregroundColor(.blue)
            VStack(alignment: .leading){
                Text(title).font(.headline)
                Text(address).font(.subheadline)
            }
            Spacer()
        }
    }
}

struct ShoppingListCell_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListCell(title: "Item 1", address: "testing data for address")
    }
}
