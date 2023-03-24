//
//  SearchGroup.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 24/03/23.
//

import SwiftUI

struct SearchGroup: UIViewRepresentable {
    
    @Binding private var text: String
    private var placeholder = ""
    
    init(text: Binding<String>) {
        _text = text
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.placeholder = placeholder
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
        uiView.placeholder = placeholder
    }
}

extension SearchGroup {
    func placeholder(_ string: String) -> SearchGroup {
        var view = self
        view.placeholder = string
        return view
    }
}
