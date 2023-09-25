//
//  BusinessCard.swift
//  QuickCard
//
//  Created by Phanupong Permpimol on 22/9/2566 BE.
//

import SwiftUI

struct User{
    var name: String
    var email: String
    var position: String
    var link: String
    var location: String
    
    init(){
        self.name = "John Doe"
        self.email = "john@example.com"
        self.position = "Software Engineer"
        self.link = "example.com"
        self.location = "123 Address Bangkok Thailand"
    }
}

struct BusinessCard: View {
    @State var user = User()
    var body: some View {
        //        VStack {
        //            HStack {
        //                Text("Hello SwiftUI")
        //                    .font(.title)
        //                .bold()
        //                Image(systemName: "pencil")
        //            }
        //            ZStack {
        //                Color.blue
        //                Text("Show Message in Blue rectangle")
        //            }
        //        }
        
        ZStack{
            Rectangle()
                .fill(Color("PrimaryColor"))
                .frame(width: 320, height: 170)
                .cornerRadius(20)
            
            VStack(alignment: .leading){
                Text(user.name).font(.title).foregroundColor(.white)
                
                Text(user.position).italic()
                    .foregroundColor(.white)
                Spacer()
                ImageView(imageName: "envelope.badge.fill", text: .constant(user.email))
                ImageView(imageName: "link.circle.fill", text: .constant(user.link))
                ImageView(imageName: "location.circle.fill", text: .constant(user.location))
            }.frame(width: 300, height: 130)
        }
    }
}

struct BusinessCard_Previews: PreviewProvider {
    static var previews: some View {
        BusinessCard()
    }
}
