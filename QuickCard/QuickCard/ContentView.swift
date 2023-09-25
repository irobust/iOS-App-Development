//
//  ContentView.swift
//  QuickCard
//
//  Created by Phanupong Permpimol on 22/9/2566 BE.
//

import SwiftUI

let data = 1...10

struct ContentView: View {
    @State private var colorValue = ""
    @State private var color: Color = Color.blue
    @State private var showColor = false

    var body: some View {
        
//        VStack {
//            TextField("Enter color: ", text: $colorValue, onCommit: {
//                self.showColor = true
//                if self.showColor {
//                    self.color = Color(self.colorValue)
//                }
//            })
//            Text(self.colorValue)
//            Rectangle().fill(self.color)
//        }
        
        NavigationView {
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(data, id:\.self){ item in
                        NavigationLink(destination: ChartView()) {
                            BusinessCard()
                        }
                    }
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
