//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 01/03/23.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
