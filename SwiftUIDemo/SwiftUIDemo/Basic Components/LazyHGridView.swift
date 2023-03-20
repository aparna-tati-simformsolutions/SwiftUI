//
//  LazyHGrid.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 20/03/23.
//

import SwiftUI

struct LazyHGridView: View {
    
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    private var colors: [Color] = [.yellow, .purple, .green]
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItemLayout) {
                ForEach((0...99), id: \.self) { image in
                    Image(systemName: symbols[image % symbols.count])
                        .font(.system(size: 30))
                        .frame(width: 100, height: 100)
                        .background(colors[image % colors.count])
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct LazyHGrid_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridView()
    }
}
