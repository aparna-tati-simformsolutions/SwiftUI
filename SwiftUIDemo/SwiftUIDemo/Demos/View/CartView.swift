//
//  CartView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 07/03/23.
//

import SwiftUI

enum Segments: String, CaseIterable {
    case lazyVGrid = "LazyVGrid"
    case lazyHGrid = "LazyHGrid"
}

struct CartView: View {
 
    @State var segmentSelection: Segments = .lazyVGrid
    
    var body: some View {
        VStack {
            Picker("", selection: $segmentSelection) {
                ForEach(Segments.allCases, id: \.self) { option in
                    Text(option.rawValue)
                }
            }.pickerStyle(.segmented)
                .padding()
                .onChange(of: segmentSelection) { newValue in
                    segmentSelection = newValue
                }
            Spacer()
            SegmentedView(selectedSegment: $segmentSelection)
            Spacer()
        }
    }
}

struct SegmentedView: View {
    
    @Binding var selectedSegment: Segments
    
    var body: some View {
        switch selectedSegment {
        case .lazyVGrid:
            LazyVGridView()
        case .lazyHGrid:
            LazyHGridView()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
