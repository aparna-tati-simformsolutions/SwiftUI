//
//  UsersView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 07/03/23.
//

import SwiftUI

struct UsersView: View {
    
    @StateObject var countryViewModel = CountryViewModel()
    
    var body: some View {
        VStack {
            List(countryViewModel.countryStates.data) { item in
                Section(header: Text(item.country)) {
                    ForEach(item.cities.indices, id: \.self) { city in
                        CountryRow(city: item.cities[city])
                    }
                }
            }
            .id(UUID())
        }
        .onAppear {
            countryViewModel.getCountriesAndStates()
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
