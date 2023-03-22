//
//  StateView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 22/03/23.
//

import SwiftUI

struct StateView: View {
    
    @State private var isNight = true
    @State private var isShowingSheet = false
    
    var body: some View {
        ZStack {
            Color(isNight ? .black : .blue).ignoresSafeArea()
            
            VStack {
                TimeOfDayImage(image: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                
                Button {
                    isShowingSheet = true
                } label: {
                    ButtonLabel(title: "Change Time of Day", image: "clock.fill", color: .green)
                }
                .padding(.top, 50)
            }
        }
        .sheet(isPresented: $isShowingSheet) {
            ChangeDaySheetView(isNight: $isNight)
        }
    }
}

struct TimeOfDayImage: View {
    
    var image: String
    
    var body: some View {
        Image(systemName: image)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
    }
}

struct ButtonLabel: View {
    
    var title: String
    var image: String
    var color: Color
    
    var body: some View {
        Label(title, systemImage: image)
            .frame(width: 200, height: 50)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding()
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
