//
//  ChartView.swift
//  QuickCard
//
//  Created by Phanupong Permpimol on 22/9/2566 BE.
//

import SwiftUI

struct ChartView: View {
    var body: some View {
        GeometryReader{ proxy in
            HStack(alignment: .bottom, spacing: 5) {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: proxy.size.width / 5, height: 70)
                Rectangle()
                    .fill(Color.green)
                    .frame(width: proxy.size.width / 5, height: 50)
                Rectangle()
                    .fill(Color.green)
                    .frame(width: proxy.size.width / 5, height: 30)
                Rectangle()
                    .fill(Color.green)
                    .frame(width: proxy.size.width / 5, height: 80)
                Rectangle()
                    .fill(Color.green)
                    .frame(width: proxy.size.width / 5, height: 90)
                    
            }.frame(width: proxy.size.width, height: 200)
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
