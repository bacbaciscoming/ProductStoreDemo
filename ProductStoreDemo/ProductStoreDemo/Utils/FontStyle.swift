//
//  FontStyle.swift
//  ProductStoreDemo
//
//  Created by Pit on 12/6/2564 BE.
//

import UIKit

final class FontStyle{

    static func HelveticaBold(size: CGFloat) -> UIFont{
        return UIFont(name: "Helvetica-Bold", size: size)!
    }
    
    static func Helvetica(size: CGFloat) -> UIFont{
        return UIFont(name: "Helvetica", size: size)!
    }
    
    static func MontserratBold(size: CGFloat) -> UIFont{
        return UIFont(name: "Montserrat-Bold", size: size)!
    }
}
