//
//  ChartView.swift
//  QuickCard2
//
//  Created by Phanupong Permpimol on 28/9/2566 BE.
//

import SwiftUI

struct ChartView: View {
    var stat: Stat
    
    var body: some View {
        GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: 5) {
                BarView(size: proxy.size, value: stat.requests, label: "Requests")
                BarView(size: proxy.size, value: stat.completed, label: "Completed")
                BarView(size: proxy.size, value: stat.satisfaction, label: "Satisfaction")
                BarView(size: proxy.size, value: stat.delayDays, label: "Delay")
                BarView(size: proxy.size, value: stat.duration, label: "Duration")
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(stat: Stat(requests: 15
                             , completed: 25
                             , satisfaction: 3
                             , delayDays: 45
                             , duration: 55))
    }
}
