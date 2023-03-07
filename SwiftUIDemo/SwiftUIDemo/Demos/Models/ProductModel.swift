//
//  ProductModel.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 07/03/23.
//

import Foundation

struct ProductModel: Codable, Equatable, Hashable {
    var id: Double
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
}

struct Rating: Codable, Equatable, Hashable  {
    var rate: Double
    var count: Double
}


