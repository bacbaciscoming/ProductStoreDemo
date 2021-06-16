//
//  UINavigationBar+Extension.swift
//  ProductStoreDemo
//
//  Created by Pit on 12/6/2564 BE.
//

import UIKit

extension UINavigationBar{
    
    func applyTheme(){
        
        self.barTintColor = ColorPallete.red
        self.tintColor = ColorPallete.white
        self.isTranslucent = false
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorPallete.white, NSAttributedString.Key.font: FontStyle.HelveticaBold(size: 23)]
    }
}
