//
//  ProductModelTest.swift
//  ProductStoreDemoTests
//
//  Created by Pit on 16/6/2564 BE.
//

import Foundation

struct ProductTest{
    
    static let product1: ProductModel = ProductModel(id: 0,
                                                     title: "Product1",
                                                     image: "https://firebasestorage.googleapis.com/v0/b/productstoredemo.appspot.com/o/poke.jpeg?alt=media&token=6c487be9-065b-4985-94c2-729e21a8426",
                                                     content: "Content1",
                                                     isNewProduct: true,
                                                     price: 4.0)
    
    static let product2: ProductModel = ProductModel(id: 1,
                                                     title: "Product2",
                                                     image: "https://firebasestorage.googleapis.com",
                                                     content: "Content2",
                                                     isNewProduct: false,
                                                     price: 14.0)
    
    static let productList: [ProductModel] = [product1, product2]
    
}
