//
//  SwiftUILabel.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 01/03/23.
//

import SwiftUI

struct SwiftUILabel: View {
    var body: some View {
        VStack {
            Label("Lightning", systemImage: "bolt.fill")
            Label("Lightning", systemImage: "bolt.fill")
                .labelStyle(.iconOnly)
            Label("Lightning", systemImage: "bolt.fill")
                .labelStyle(.titleOnly)
            Label("Lightning", systemImage: "bolt.fill")
                .labelStyle(BackgroundStyle())
            Label("Lightning", systemImage: "bolt.fill")
                .labelStyle(VerticalStyle())
        }
    }
}

struct BackgroundStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .padding()
            .background(Color.yellow)
            .cornerRadius(10)
    }
}

struct VerticalStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
        }
        .padding(5)
        .border(.red)
    }
}

struct SwiftUILabel_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUILabel()
    }
}
