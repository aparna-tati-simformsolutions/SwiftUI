//
//  SplashView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 03/03/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            Color("navyBlue").ignoresSafeArea()
            if isActive {
                WelcomeView()
            } else {
                Image("logo1").resizable().clipShape(Circle()).frame(width: 150, height: 150)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
