//
//  ContentView.swift
//  QuickCard2
//
//  Created by Phanupong Permpimol on 28/9/2566 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var opacity: Double = 0.5
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    HStack{
                        Circle()
                            .frame(width: 25)
                            .foregroundColor(Color("PrimaryColor"))
                        Slider(value: $opacity)
                    }
                    
//                    ForEach(data,id: \.self){ _ in
//                        NavigationLink(destination: CardDetail()) {
//                            BusinessCard(opacity: $opacity)
//                        }
//                    }
                    
                    ForEach(User.users){ user in
                        NavigationLink(destination: CardDetail(user: user)) {
                            BusinessCard(opacity: $opacity, user: user)
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
