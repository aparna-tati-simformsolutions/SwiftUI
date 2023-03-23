//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 01/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    SwiftUIText()
                } label: {
                    TextStyle(text: "Text")
                }
                NavigationLink {
                    SwiftUILabel()
                } label: {
                    TextStyle(text: "Label")
                }
                NavigationLink {
                    SwiftUITextField()
                } label: {
                    TextStyle(text: "TextField")
                }
                NavigationLink {
                    WelcomeView()
                } label: {
                    TextStyle(text: "Login Demo")
                }
                NavigationLink {
                    FirstNavigationView()
                } label: {
                    TextStyle(text: "NavigationView")
                }
                NavigationLink {
                    NavigationStackView()
                } label: {
                    TextStyle(text: "NavigationStack")
                }
                NavigationLink {
                    FormView()
                } label: {
                    TextStyle(text: "Form View")
                }
                NavigationLink {
                    PropertyWrapperFirstView()
                } label: {
                    TextStyle(text: "Property Wrapper")
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
        Label(text, image: "")
            .frame(width: 200)
            .padding(10)
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .trailing, endPoint: .leading))
            .cornerRadius(40)
            .font(.title3)
    }
}
