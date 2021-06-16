//
//  ProductListPresenterTests.swift
//  ProductStoreDemo
//
//  Created by Pit on 15/6/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import ProductStoreDemo
import XCTest

class ProductListPresenterTests: XCTestCase{
    // MARK: Subject under test
    
    var sut: ProductListPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp(){
        super.setUp()
        setupProductListPresenter()
    }
    
    override func tearDown(){
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupProductListPresenter(){
        sut = ProductListPresenter()
    }
    
    // MARK: Test doubles
    
    class ProductListDisplayLogicSpy: ProductListDisplayLogic{
        
        var displayProductListCalled: Bool = false
        func displayProductList(viewModel: ProductList.List.ViewModel) {
            displayProductListCalled = true
        }
        
        var displayProductDetailCalled: Bool = false
        func displayProductDetail() {
            displayProductDetailCalled = true
        }
        
        var showAlertFailureCalled: Bool = false
        func showAlertFailure(error: ProductList.List.Error) {
            showAlertFailureCalled = true
        }
    }
    
    // MARK: Tests
    
    func testShouldPresentProductList(){
        // Given
        let spy = ProductListDisplayLogicSpy()
        sut.viewController = spy
        let response = ProductList.List.Response(productList: ProductTest.productList)
        
        // When
        sut.presentProductList(response: response)
        
        // Then
        XCTAssertTrue(spy.displayProductListCalled, "presentProductList(response:) should ask the view controller to display product list")
    }
    
    func testShouldPresentProductDetail(){
        
        // Given
        let spy = ProductListDisplayLogicSpy()
        sut.viewController = spy
        
        // When
        sut.presentProductDetail()
        
        // Then
        XCTAssertTrue(spy.displayProductDetailCalled, "presentProductDetail() should ask the view controller to display product detail")
    }
    
    func testShouldPresentProductListFailure(){
        
        // Given
        let spy = ProductListDisplayLogicSpy()
        sut.viewController = spy
        let error = ProductList.List.Error(errorDescription: "Error Description")
        
        // When
        sut.handleProductListFailure(error: error)
        
        // Then
        XCTAssertTrue(spy.showAlertFailureCalled, "handleProductListFailure() should ask the view controller to show alert when get product list failure")
    }
}