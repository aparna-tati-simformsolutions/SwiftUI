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
    
    var body: some View {
        NavigationView {
            List(productViewModel.productData, id: \.self) { item in
                HStack {
                    KFImage(URL(string: item.image))
                        .resizable()
                        .frame(width: 100, height: 70)
                        .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 5) {
                        Text(item.title)
                            .fontWeight(.semibold)
                            .frame(alignment: .center)
                            .minimumScaleFactor(0.5)
                        
                        Text(String(item.price))
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
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

extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!).resizable()
        }
        return self.resizable()
    }
}
