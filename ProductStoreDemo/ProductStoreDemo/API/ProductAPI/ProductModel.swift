//
//  ProductModel.swift
//  ProductStoreDemo
//
//  Created by Pit on 12/6/2564 BE.
//

import Foundation

struct ProductModel: Codable{
    
    var id: Int
    var title: String
    var image: String
    var content: String
    var isNewProduct: Bool
    var price: Float
    
    init(){
        self.id = 0
        self.title = ""
        self.image = ""
        self.content = ""
        self.isNewProduct = false
        self.price = 0.0
    }
    
    init(id: Int, title: String, image: String, content: String, isNewProduct: Bool, price: Float){
        self.id = id
        self.title = title
        self.image = image
        self.content = content
        self.isNewProduct = isNewProduct
        self.price = price
    }
}
