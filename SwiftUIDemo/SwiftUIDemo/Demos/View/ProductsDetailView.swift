//
//  ProductsDetailView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 09/03/23.
//

import SwiftUI
import Kingfisher

struct ProductsDetailView: View {

    @StateObject var productViewModel = ProductViewModel()
    var productId: Double
    
    var body: some View {
        VStack {
            KFImage(URL(string: productViewModel.productDetails.image))
                .resizable()
                .frame(width: 200, height: 120)
                .cornerRadius(20)
            VStack(spacing: 5) {
                Text(productViewModel.productDetails.title)
                    .fontWeight(.semibold)
                    .frame(alignment: .center)
                    .minimumScaleFactor(0.5)
                Text(productViewModel.productDetails.description)
                    .font(.subheadline)
                    .frame(alignment: .center)
                Text(productViewModel.productDetails.category)
                    .font(.subheadline)
                    .frame(alignment: .center)
                Text(String(productViewModel.productDetails.price))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .onAppear {
            productViewModel.getProductDetails(productId: Int(productId))
        }
    }
}

