//
//  ChangeDaySheetView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 22/03/23.
//

import SwiftUI

struct ChangeDaySheetView: View {
    
    @Binding var isNight: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Button {
                presentationMode.wrappedValue.dismiss()
                isNight = true
            } label: {
                ButtonLabel(title: "Make Night", image: "moon.stars.fill", color: .black)
            }
            
            Button {
                presentationMode.wrappedValue.dismiss()
                isNight = false
            } label: {
                ButtonLabel(title: "Make Day", image: "cloud.sun.fill", color: .indigo)
            }
        }
    }
}

struct ChangeDaySheetView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeDaySheetView(isNight: .constant(false))
    }
}
