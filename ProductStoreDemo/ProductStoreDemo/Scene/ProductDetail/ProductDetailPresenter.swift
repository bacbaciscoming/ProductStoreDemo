//
//  ProductDetailPresenter.swift
//  ProductStoreDemo
//
//  Created by Pit on 12/6/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ProductDetailPresentationLogic{
    func presentProductDetail(response: ProductDetail.Detail.Response)
}

class ProductDetailPresenter: ProductDetailPresentationLogic{
    
    weak var viewController: ProductDetailDisplayLogic?
    
    func presentProductDetail(response: ProductDetail.Detail.Response){
        
        let product = ProductDetail.Detail.ViewModel.Product(id: response.product.id,
                                                             title: response.product.title,
                                                             image: response.product.image,
                                                             content: response.product.content,
                                                             isNewProduct: response.product.isNewProduct,
                                                             price: response.product.price)
        let viewModel = ProductDetail.Detail.ViewModel(product: product)
        self.viewController?.displayProductDetail(viewModel: viewModel)
    }
}
