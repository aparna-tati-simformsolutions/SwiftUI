//
//  SearchView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 24/03/23.
//

import SwiftUI

struct SearchView: View {

    @State private var searchedText = ""
    @State private var placeHolder = "Search"
    @State private var isPopupPresenetd = false
    
    var fruits = ["🍎 Apple", "🍌 Banana", "🍋 Mango", "🍇 Graps", "🍉 Watermelon", "🍒 Cherry", "🍓 Strawberry"]
    
    var searchResults: [String] {
        if searchedText.isEmpty {
            return fruits
        } else {
            return fruits.filter {
                $0.contains(searchedText)
            }
        }
    }

    var body: some View {
        VStack {
            List {
                ForEach(searchResults, id: \.self) { fruit in
                    Text(fruit)
                }
            }.searchable(text: $searchedText, placement: .navigationBarDrawer(displayMode: .always))
        }
        .toolbar {
            ToolbarItem {
                Button {
                    isPopupPresenetd = true
                } label: {
                    Label("Add", systemImage: "plus.app")
                }
            }
        }
       
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
