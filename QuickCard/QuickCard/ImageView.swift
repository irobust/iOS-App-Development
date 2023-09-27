//
//  ImageView.swift
//  QuickCard
//
//  Created by Phanupong Permpimol on 27/9/2566 BE.
//

import SwiftUI

struct ImageView: View {
    var imageName: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: self.imageName)
                .foregroundColor(.orange)
            Text(self.text)
        }.foregroundColor(.white)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageName: "envelope.badge.fill", text: .constant("john@example.com"))
    }
}
