//
//  ColorSlider.swift
//  ColorPicker
//
//  Created by Phanupong Permpimol on 28/9/2566 BE.
//

import SwiftUI

struct ColorSlider: View {
    @ObservedObject var customColor: CustomColor
    @EnvironmentObject var theme: Theme
    
    var color: Color = Color.red
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "circle.fill")
                    .foregroundColor(color)
                Slider(value: $customColor.red, in: 0...1, step: 0.1)
            }
            Text("red: \(customColor.red), green: \(customColor.green), blue: \(customColor.blue)")
            Text("Current theme is \(theme.name)")
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(customColor: CustomColor())
    }
}
