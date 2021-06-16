//
//  WebServiceRequestTests.swift
//  ProductStoreDemoTests
//
//  Created by Pit on 17/6/2564 BE.
//

@testable import ProductStoreDemo
import XCTest
import Alamofire

class WebServiceRequestTests: XCTestCase {

    // MARK: Subject under test
    
    var sut: WebServiceRequest!
    
    override func setUp() {
        super.setUp()
        self.setUpWebServiceRequest()
    }
    
    func setUpWebServiceRequest(){
        sut = WebServiceRequest.sharedInstance
    }

    func testShouldGetRequestFromAlamofireAndPassDataToModel(){
        
        // Given
        let url: String = "https://ecommerce-product-app.herokuapp.com/products"
        if let requestUrl = URL(string: url) {
            
            let e = expectation(description: "Alamofire")
            
            // When
            AF.request(requestUrl, method: .get)
                .validate()
                .responseData(completionHandler: {(response) in
                    
                    // Then
                    switch response.result {
                    case .success(let data):
                        do{
                            let result = try JSONDecoder().decode([ProductModel].self, from: data)
                            XCTAssertNotNil(result)
                            e.fulfill()
                        }
                        catch (let jsonError as NSError){
                            XCTFail("JSON decode failed: \(jsonError.localizedDescription)")
                            e.fulfill()
                        }
                    case .failure(let error):
                        XCTFail("Server response failed : \(error.localizedDescription)")
                        e.fulfill()
                    }
                })
            waitForExpectations(timeout: 10.0, handler: nil)
        }
    }
}
