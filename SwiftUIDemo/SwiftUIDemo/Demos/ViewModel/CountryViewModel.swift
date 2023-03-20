//
//  CountryViewModel.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 20/03/23.
//

import Alamofire

class CountryViewModel: ObservableObject {
    
    @Published var countryStates = Country(error: false, msg: "", data: [])
    
    func getCountriesAndStates() {
        AF.request("https://countriesnow.space/api/v0.1/countries/", method: .get).response { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let data = data else { return }
                    self.countryStates = try JSONDecoder().decode(Country.self, from: data)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
