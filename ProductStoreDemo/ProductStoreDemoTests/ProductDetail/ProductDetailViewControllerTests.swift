//
//  ProductDetailViewControllerTests.swift
//  ProductStoreDemo
//
//  Created by Pit on 16/6/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import ProductStoreDemo
import XCTest

class ProductDetailViewControllerTests: XCTestCase{
    
    // MARK: Subject under test
    
    var sut: ProductDetailViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp(){
        super.setUp()
        window = UIWindow()
        setupProductDetailViewController()
    }
    
    override func tearDown(){
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupProductDetailViewController(){

        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: self.classForCoder))
        sut = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController
    }
    
    func loadView(){
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class ProductDetailBusinessLogicSpy: ProductDetailBusinessLogic{
        
        var getProductDetailCalled: Bool = false
        func getProductDetail(request: ProductDetail.Detail.Request) {
            getProductDetailCalled = true
        }
    }
    
    class ProductDetailRouterSpy: ProductDetailRouter{
        
        var popViewControllerCalled = false
        override func popViewController(){
            popViewControllerCalled = true
        }
    }
    
    // MARK: Tests
    
    func testShouldGetProductDetailWhenViewIsLoaded(){
        
        // Given
        
        let spy = ProductDetailBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        
        loadView()
        
        // Then
        
        XCTAssertTrue(spy.getProductDetailCalled, "viewDidLoad() should ask the interactor to do get product detail")
    }
    
    func testShouldDisplayProductDetail(){
        
        // Given
        
        let viewModel = ProductDetail.Detail.ViewModel(product: ProductDetail.Detail.ViewModel.Product(id: 0, title: "Title", image: "https://firebasestorage.googleapis.com/v0/b/productstoredemo.appspot.com/o/poke.jpeg?alt=media&token=6c487be9-065b-4985-94c2-729e21a8426", content: "Content", isNewProduct: true, price: 4.0))
        
        // When
        
        loadView()
        sut.displayProductDetail(viewModel: viewModel)
        
        // Then
        
        XCTAssertEqual(sut.titleLabel.text, "Title", "Displaying an product should update the title label")
        XCTAssertEqual(sut.priceLabel.text, "4.00", "Displaying an product should update the price label")
        XCTAssertEqual(sut.descriptionLabel.text, "Content", "Displaying an product should update the description label")
        XCTAssertTrue(sut.newLabel.isHidden != true, "Displaying an product should update hidden in the new label")
        XCTAssertNotNil(sut.productImage, "Displaying an product should update product image")
    }
    
    func testShouldPopViewController(){
        
        //Given
        
        let spy = ProductDetailRouterSpy()
        sut.router = spy
        loadView()
        
        //When
        
        sut.back()
        
        //Then
        
        XCTAssertTrue(spy.popViewControllerCalled, "popViewController should ask the router to go back")
    }
}