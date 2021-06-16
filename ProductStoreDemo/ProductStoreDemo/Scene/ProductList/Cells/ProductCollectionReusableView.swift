//
//  ProductCollectionReusableView.swift
//  ProductStoreDemo
//
//  Created by Pit on 12/6/2564 BE.
//

import UIKit

class ProductCollectionReusableView: UICollectionReusableView{
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUI(){
        self.titleLabel.text = "Start picking your treats"
    }
    
    func setFont(){
        self.titleLabel.font = FontStyle.HelveticaBold(size: 18)
    }
    
    func setColor(){
        self.backgroundColor = ColorPallete.gray
        self.titleLabel.textColor = ColorPallete.black
    }
}
