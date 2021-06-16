//
//  ProductAPITests.swift
//  ProductStoreDemoTests
//
//  Created by Pit on 16/6/2564 BE.
//

@testable import ProductStoreDemo
import XCTest

class ProductAPITests: XCTestCase {
    
    // MARK: Subject under test
    
    var sut: ProductAPI!
    
    override func setUp() {
        super.setUp()
        self.setUpProductAPI()
    }
    
    func setUpProductAPI(){
        sut = ProductAPI.sharedInstance
    }
    
    class WebServiceSpy: WebServiceRequest{
        
        var getCalled: Bool = false
        override func get<T>(path: String, completion: @escaping (T) -> Void, failure: @escaping (String) -> Void) where T : Decodable, T : Encodable {
            getCalled = true
        }
    }

    func testShouldGetProductListAndProductById(){
        
        // Given
        let webServiceSpy = WebServiceSpy()
  
        // When
        webServiceSpy.get(path: sut.path) { (productList: [ProductModel]) in
 
        } failure: { (error: String) in
    
        }

        //Then
        XCTAssertTrue(webServiceSpy.getCalled, "get<T>(path:) should ask the webservice to get product list")
    }
}
