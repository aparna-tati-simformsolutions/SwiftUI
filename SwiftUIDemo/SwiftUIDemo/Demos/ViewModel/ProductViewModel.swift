//
//  ProductViewModel.swift
//  SwiftUIDemo
//
//  Created by Aparna Tati on 07/03/23.
//

import Alamofire

class ProductViewModel: ObservableObject {
    
    @Published var productData = [ProductModel]()
    @Published var productDetails = ProductModel(id: 0, title: "", price: 0, description: "", category: "", image: "", rating: Rating(rate: 0, count: 0))
    
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
    
    func getProductDetails(productId: Int) {
        AF.request("https://fakestoreapi.com/products/\(productId)", method: .get).response { (response) in
            switch response.result {
            case .success(let data):
                do {
                    guard let data = data else { return }
                    self.productDetails = try JSONDecoder().decode(ProductModel.self, from: data)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
