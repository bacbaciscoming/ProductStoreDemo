//
//  UIImageView+Extension.swift
//  ProductStoreDemo
//
//  Created by Pit on 12/6/2564 BE.
//

import UIKit
import SDWebImage

extension UIImageView{
    
    func loadImage(from url: String){
        
        let escapeString: String = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let errorImage: UIImage? = UIImage(named: "errorImage")
        self.sd_setImage(with: URL(string: escapeString)) { (image: UIImage?, error: Error?, cacheType: SDImageCacheType, url: URL?) in
            if (error != nil){
                self.image = errorImage
            }
        }
    }
}
