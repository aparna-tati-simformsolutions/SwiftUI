//
//  CountryModel.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 20/03/23.
//

import Foundation

struct Country: Codable {
    let error: Bool
    let msg: String
    let data: [CountryCities]
}

struct CountryCities: Codable,Identifiable {
    let id = UUID()
    let iso2, iso3, country: String
    let cities: [String]
}

