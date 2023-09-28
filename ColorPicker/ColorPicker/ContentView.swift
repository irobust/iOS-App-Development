//
//  ContentView.swift
//  ColorPicker
//
//  Created by Phanupong Permpimol on 28/9/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @StateObject var color = CustomColor()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(Color(red: color.red,
                                       green: color.green,
                                       blue: color.blue))
            ColorSlider(customColor: color)
            ColorSlider(customColor: color, color: Color.green)
            ColorSlider(customColor: color, color: Color.blue)
        }
        .padding()
        .environmentObject(Theme())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
