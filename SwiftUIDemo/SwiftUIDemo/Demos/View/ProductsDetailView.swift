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
            ScrollView {
                KFImage(URL(string: productViewModel.productDetails.image))
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.0)
                    .cornerRadius(20)
                Text(productViewModel.productDetails.title)
                    .fontWeight(.bold)
                    .minimumScaleFactor(0.5)
                    .padding(10)
                VStack(alignment: .leading) {
                    Text("Description")
                        .fontWeight(.bold)
                        .padding(.leading, 10)
                    Text(productViewModel.productDetails.description)
                        .font(.subheadline)
                        .frame(alignment: .center)
                        .padding(.all, 10)
                    HStack {
                        Text("Category:")
                            .fontWeight(.bold)
                        Text(productViewModel.productDetails.category)
                            .font(.subheadline)
                            .frame(alignment: .center)
                    }.padding(10)
                }
                HStack {
                    Text("M.R.P.:")
                        .fontWeight(.bold)
                        .padding(.leading, 10)
                    Text(String(Int(productViewModel.productDetails.price)))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
            }
        }
        .onAppear {
            productViewModel.getProductDetails(productId: Int(productId))
        }
    }
}

