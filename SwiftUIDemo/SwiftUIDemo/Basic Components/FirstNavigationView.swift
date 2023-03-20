//
//  FirstNavigationView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 20/03/23.
//

import SwiftUI

struct FirstNavigationView: View {
    
    @State var navigateToRoot = false
    
    var body: some View {
        VStack {
            CircleNumberView(color: .red, number: 1)
                .navigationTitle("Red View")
                .offset(y: -50)
            NavigationLink(destination: SecondNavigationView(color: .blue, isNavigateToRoot: $navigateToRoot)) {
                Text("Go to Blue View")
                    .padding()
                    .frame(width: 250, height: 50)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
        }
    }
}

struct SecondNavigationView: View {
    
    var color: Color
    @Binding var isNavigateToRoot: Bool
    
    var body: some View {
        VStack {
            CircleNumberView(color: color, number: 2)
                .navigationTitle("Blue View")
                .offset(y: -50)
            
            NavigationLink(destination: ThirdNavigationView(color: .green, isNavigateToRoot: $isNavigateToRoot)) {
                Text("Go to Green View")
                    .padding()
                    .frame(width: 250, height: 50)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
        }
    }
}

struct ThirdNavigationView: View {
    
    var color: Color
    @Binding var isNavigateToRoot: Bool
    
    var body: some View {
        VStack {
            CircleNumberView(color: color, number: 3)
                .navigationTitle("Green View")
                .offset(y: -50)
            
            NavigationLink(destination: FirstNavigationView(), isActive: $isNavigateToRoot) {
                Text("Go to Red View")
                    .padding()
                    .frame(width: 250, height: 50)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    .onTapGesture {
                        isNavigateToRoot = true
                    }
            }
        }
    }
}

struct CircleNumberView: View {
    
    var color: Color
    var number: Int
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(color)
            Text("\(number)")
                .font(.title)
                .foregroundColor(Color.white)
        }
    }
}

struct FirstNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        FirstNavigationView()
    }
}
