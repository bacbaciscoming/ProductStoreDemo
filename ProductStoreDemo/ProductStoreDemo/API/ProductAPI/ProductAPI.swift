//
//  ProductAPI.swift
//  ProductStoreDemo
//
//  Created by Pit on 12/6/2564 BE.
//

import Foundation
import Alamofire

class ProductAPI{
    
    static let sharedInstance: ProductAPI = {
        return ProductAPI()
    }()
    
    private let webService: WebServiceRequest = WebServiceRequest.sharedInstance
    let path: String = "https://ecommerce-product-app.herokuapp.com/products"

    func getProductList(completion: @escaping([ProductModel]) -> Void, failure: @escaping (String) -> Void){
        self.webService.get(path: path, completion: completion, failure: failure)
    }
    
    func getProduct(by id: Int, completion: @escaping(ProductModel) -> Void, failure: @escaping (String) -> Void){
        self.webService.get(path: "\(self.path)/\(id)", completion: completion, failure: failure)
    }
}
