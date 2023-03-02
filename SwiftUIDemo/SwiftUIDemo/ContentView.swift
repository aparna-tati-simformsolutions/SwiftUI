//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 01/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SwiftUIText()) {
                    Text("Text")
                        .frame(width: 200)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .trailing, endPoint: .leading))
                        .cornerRadius(40)
                        .font(.title3)
                }
                NavigationLink(destination: SwiftUILabel()) {
                    Text("Label")
                        .frame(width: 200)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .trailing, endPoint: .leading))
                        .cornerRadius(40)
                        .font(.title3)
                }
                NavigationLink(destination: SwiftUITextField()) {
                    Text("TextField")
                        .frame(width: 200)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .trailing, endPoint: .leading))
                        .cornerRadius(40)
                        .font(.title3)
                }
                NavigationLink(destination: WelcomeView()) {
                    Text("LoginDemo")
                        .frame(width: 200)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .trailing, endPoint: .leading))
                        .cornerRadius(40)
                        .font(.title3)
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
