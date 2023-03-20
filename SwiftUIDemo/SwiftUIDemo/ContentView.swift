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
                   TextStyle(text: "Text")
                }
                NavigationLink(destination: SwiftUILabel()) {
                    TextStyle(text: "Label")
                }
                NavigationLink(destination: SwiftUITextField()) {
                    TextStyle(text: "TextField")
                }
                NavigationLink(destination: WelcomeView()) {
                    TextStyle(text: "LoginDemo")
                }
                NavigationLink(destination: FirstNavigationView()) {
                    TextStyle(text: "Navigation")
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

struct TextStyle: View {
    var text: String

    var body: some View {
        Text(text)
            .frame(width: 200)
            .padding(10)
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .trailing, endPoint: .leading))
            .cornerRadius(40)
            .font(.title3)
    }
}
