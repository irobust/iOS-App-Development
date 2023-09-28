//
//  BusinessCard.swift
//  QuickCard2
//
//  Created by Phanupong Permpimol on 28/9/2566 BE.
//

import SwiftUI

struct BusinessCard: View {
    @Binding var opacity: Double
    
    var isChartLoaded = false
    var user: User
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("PrimaryColor"))
                .frame(width: 300, height: 200)
                .cornerRadius(20)
                .shadow(radius: 10)
                .opacity(opacity)
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    if isChartLoaded {
                        Image(systemName: "arrow.up.square")
                    }else {
                        Image(systemName: "arrow.down.app")
                    }
                }.frame(width: 250)
                Text("\(user.firstName) \(user.lastName)")
                    .font(.title)
                Text(user.title)
                    .italic()
                ImageView(imageName: "envelope.fill", text: user.email)
                ImageView(imageName: "link", text: user.companyUrl)
                ImageView(imageName: "location.fill", text: user.address)
            
                Button {
                    opacity = 0.5
                } label: {
                    Label("Reset", systemImage: "clear.fill")
                }
                .frame(maxWidth: 250)
                
//                Button(action: reset){
//                    Label("Reset", systemImage: "clear.fill")
//                }
//                .padding(.top)
//                .frame(maxWidth: 250)
            }
            .padding()
            .foregroundColor(.white)
        }
    }
    
//    func reset(){
//        opacity = 0.5
//    }
}

struct BusinessCard_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCard(opacity: .constant(0.5)
            , user: User(firstName: "Natalie"
            , lastName: "Kim"
            , title: "Software Manager"
            , email: "nataliekim@yahoo.com"
            , companyUrl: "natalite.com"
            , address: "8888 Hidden Marker Road"
            , stat: Stat(requests: 15, completed: 25, satisfaction: 3, delayDays: 45, duration: 55)))
    }
}
