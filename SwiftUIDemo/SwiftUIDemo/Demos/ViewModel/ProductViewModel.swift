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
        AF.request("https://fakestoreapi.com/products", method: HTTPMethod.get, encoding: URLEncoding.default).response { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let data = data else { return }
                    let jsonData = try JSONDecoder().decode([ProductModel].self, from: data)
                    jsonData.forEach { jsonData in
                        self.productData.append(jsonData)
                    }
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
