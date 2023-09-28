//
//  BarView.swift
//  QuickCard2
//
//  Created by Phanupong Permpimol on 28/9/2566 BE.
//

import SwiftUI

struct BarView: View {
    var size: CGSize
    var value: Int
    var label: String
    var body: some View {
        VStack{
            Rectangle()
                .fill(Color.green)
                .frame(width: size.width / 5
                       , height: size.height * (CGFloat(value) / 100.0))
            Text(label)
                .rotationEffect(.degrees(-80)).offset(y: 60)
                .frame(width: 80)
                .font(.footnote)
        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(size: CGSize(width: 50, height: 200), value: 70
                , label: "requests")
    }
}
