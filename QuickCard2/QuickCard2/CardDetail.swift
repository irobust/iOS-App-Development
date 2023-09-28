//
//  CardDetail.swift
//  QuickCard2
//
//  Created by Phanupong Permpimol on 28/9/2566 BE.
//

import SwiftUI

struct CardDetail: View {
    var user: User
    @State var isChartVisible = false
    @State var isChartLoaded = false
    
    var body: some View {
        VStack{
            BusinessCard(opacity: .constant(1), isChartLoaded: isChartLoaded, user: user)
                .padding(.bottom, 20)
                .scaleEffect(isChartVisible ? 0.8 : 1)
                .onTapGesture {
                    withAnimation(.easeOut(duration: 1.5)){
                        isChartVisible.toggle()
                    }
                }
                .onLongPressGesture() {
                    
                }
            Spacer()
            if isChartVisible {
                ChartView(stat: user.stat)
                    .scaleEffect(0.6)
                    .transition(.move(edge: .bottom))
                    .onAppear {
                        isChartLoaded = true
                    }
                    .onDisappear {
                        isChartLoaded = false
                    }
            }
            
        }
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(user: User(firstName: "Natalie"
                              , lastName: "Kim"
                              , title: "Software Manager"
                              , email: "nataliekim@yahoo.com"
                              , companyUrl: "natalite.com"
                              , address: "8888 Hidden Marker Road"
                              , stat: Stat(requests: 15, completed: 25, satisfaction: 3, delayDays: 45, duration: 55)))
    }
}
