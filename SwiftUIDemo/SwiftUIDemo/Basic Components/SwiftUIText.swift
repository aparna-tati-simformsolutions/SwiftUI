//
//  SwiftUIText.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 01/03/23.
//

import SwiftUI

struct SwiftUIText: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title2)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.headline)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.subheadline)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.caption)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.system(size: 12, weight: .bold, design: .serif))
            Text("A text view always uses exactly the amount of space")
                .frame(width: 150, height: 80, alignment: .center)
                .lineLimit(5)
                .foregroundColor(.cyan)
                .multilineTextAlignment(.trailing)
                .fontWeight(.medium)
                .opacity(0.5)
                .rotationEffect(.radians(0), anchor: UnitPoint(x: 0.5, y: 0.5))
            Text("A text view always uses exactly the amount of space")
                .frame(width: 120)
                .frame(alignment: .trailing)
                .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
                .shadow(color: .gray, radius: 2, x: 0, y: 5)
            Text("**Bold**, *Italic*, You can [Click this link](https://www.appcoda.com) to go to appcoda.com")
        }
    }
}

struct SwiftUIText_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIText()
    }
}
