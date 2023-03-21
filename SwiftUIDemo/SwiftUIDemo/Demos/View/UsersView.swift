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
        ZStack {
            List(countryViewModel.countryStates.data) { item in
                Section(header: Text(item.country)) {
                    ForEach(item.cities.indices, id: \.self) { city in
                        CountryRow(city: item.cities[city])
                    }
                }
            }
            .id(UUID())
            if !countryViewModel.isDataFetch {
                ProgressView {
                    Text("Loading")
                        .bold()
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
                .tint(.red)
            }
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
