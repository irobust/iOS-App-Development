//
//  CustomColor.swift
//  ColorPicker
//
//  Created by Phanupong Permpimol on 28/9/2566 BE.
//

import Foundation

class CustomColor: ObservableObject {
    @Published var red = 0.0
    @Published var green = 0.0
    @Published var blue = 0.0
    
    init(){
        red   = 0.0
        green = 0.0
        blue  = 0.0
    }
}

class Theme: ObservableObject {
    var name = "light"
}
