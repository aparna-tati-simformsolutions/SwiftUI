//
//  UsersView.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 07/03/23.
//

import SwiftUI

struct TaskRow: View {
    var city: String
    
    var body: some View {
        Text(city)
    }
}

struct UsersView: View {
    
    @StateObject var countryViewModel = CountryViewModel()

    var body: some View {
        VStack {
            List(countryViewModel.countryStates.data) { item in
//                Section(header: "\(item.country)") {
//                    
//                }
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
