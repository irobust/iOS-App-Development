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
                switch color {
                case Color.green:
                    Slider(value: $customColor.green, in: 0...1, step: 0.1)
                case Color.blue:
                    Slider(value: $customColor.blue, in: 0...1, step: 0.1)
                default:
                    Slider(value: $customColor.red, in: 0...1, step: 0.1)
                }
            }
            
            Text("red: \(String(format: "%.1f", customColor.red)), green: \(String(format: "%.1f", customColor.green)), blue: \(String(format: "%.1f", customColor.blue))")
            Text("Current theme is \(theme.name)")
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(customColor: CustomColor())
    }
}
