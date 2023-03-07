//
//  ProductModel.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 07/03/23.
//

import Foundation

struct ProductModel: Codable {
    var id: Int
    var title: String
    var price: String
    var description: String
    var category: String
    var image: String
}
