//
//  ProductsView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 07/03/23.
//

import SwiftUI
import Alamofire
import Kingfisher

struct ProductsView: View {
    
    @StateObject var productViewModel = ProductViewModel()
    @State private var selectedProductTitle: Double = 0
    @State private var showModal: Bool = false
    
    var body: some View {
        VStack {
            NavigationView {
                List(productViewModel.productData, id: \.self) {
                    product in
                    NavigationLink(destination: ProductsDetailView(productId:product.id)) {
                        ProductRow(product: product)
                    }
                }
                .listStyle(.plain)
            }
            .onAppear {
                productViewModel.getAllProducts()
            }
            .navigationTitle("Products")
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
