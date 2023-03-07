//
//  ProductsView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 07/03/23.
//

import SwiftUI
import Alamofire

struct ProductsView: View {
    
    @StateObject var productViewModel = ProductViewModel()
    
    var body: some View {
        Text("Hello, Products!")
        .onAppear {
            getAll()
        }
    }
}

extension ProductsView {

    func getAll() {
        print(productViewModel.productData)
        productViewModel.getAllProducts()
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
