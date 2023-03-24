//
//  HomeView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 24/03/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var images: [ImageModel] = []
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                ForEach(images) { image in
                    CardView(image)
                }
            }
            .padding(20)
        }
        .navigationTitle("Peel Effect")
        .onAppear {
            for index in 1...4 {
                images.append(.init(imageName: "pic\(index)"))
            }
        }
    }
    
    @ViewBuilder
    func CardView(_ imageModel: ImageModel) -> some View {
        GeometryReader {
            let size = $0.size
            
            ZStack {
                Image(imageModel.imageName)
                    .resizable()
                    .frame(width: size.width, height: size.height)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            }
        }
        .frame(height: 150)
        .contentShape(Rectangle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
