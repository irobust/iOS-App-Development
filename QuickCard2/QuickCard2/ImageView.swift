//
//  ImageView.swift
//  QuickCard2
//
//  Created by Phanupong Permpimol on 28/9/2566 BE.
//

import SwiftUI

struct ImageView: View {
    var imageName: String
    var text: String
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.orange)
            Text(text)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageName: "envelope.fill", text: "john@example.com")
    }
}
