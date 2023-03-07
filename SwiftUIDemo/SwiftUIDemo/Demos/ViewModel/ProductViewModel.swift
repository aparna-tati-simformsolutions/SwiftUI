//
//  ProductViewModel.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 07/03/23.
//

import Alamofire

class ProductViewModel: ObservableObject {
    
    @Published var productData = [ProductModel]()
    
    func getAllProducts() {
        AF.request("https://fakestoreapi.com/products", method: .get).response { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let data = data else { return }
                    self.productData = try JSONDecoder().decode([ProductModel].self, from: data)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
