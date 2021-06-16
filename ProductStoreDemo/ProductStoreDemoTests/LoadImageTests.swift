//
//  LoadImageTests.swift
//  ProductStoreDemoTests
//
//  Created by Pit on 17/6/2564 BE.
//
@testable import ProductStoreDemo
import XCTest
import SDWebImage

class LoadImageTests: XCTestCase {
    
    func testShoudLoadImage(){
        
        let e = expectation(description: "Image from https did load")
        
        let viewer = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 250))
        viewer.sd_setImage(with: URL(string: "https://firebasestorage.googleapis.com/v0/b/productstoredemo.appspot.com/o/poke.jpeg?alt=media&token=6c487be9-065b-4985-94c2-729e21a8426")) { (image: UIImage?, error: Error?, cacheType: SDImageCacheType, url: URL?) in
            
            if viewer.image != nil{
                e.fulfill()
            }
            else{
                XCTFail("Load image failed : \(error?.localizedDescription ?? "")")
            }
        }
        waitForExpectations(timeout: 30.0, handler: nil)
    }
}
