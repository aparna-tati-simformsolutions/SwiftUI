//
//  ProductCell.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 09/03/23.
//

import SwiftUI
import Kingfisher

struct ProductRow: View {
    
    var product: ProductModel
    
    var body: some View {
        HStack(alignment: .center) {
            KFImage(URL(string: product.image))
                .resizable()
                .frame(width: 100, height: 70)
            VStack(alignment: .leading) {
                Text(product.title)
                    .fontWeight(.semibold)
                    .frame(alignment: .center)
                Text(String(product.price))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.trailing, 20)
            Spacer()
        }
    }
}
