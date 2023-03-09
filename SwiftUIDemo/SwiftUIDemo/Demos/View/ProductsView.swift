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
        NavigationView {
            List(productViewModel.productData, id: \.self) {
                product in
                NavigationLink(destination: ProductsDetailView(productId:product.id)) {
                    ProductRow(product: product)
                }
            }
        }
        .onAppear {
            productViewModel.getAllProducts()
        }
        .navigationTitle("Products")
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}

extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!).resizable()
        }
        return self.resizable()
    }
}
