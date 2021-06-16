//
//  ProductCell.swift
//  ProductStoreDemo
//
//  Created by Pit on 12/6/2564 BE.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var newLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUI(product: ProductList.List.ViewModel.Product){
        self.imageView.loadImage(from: product.image)
        self.titleLabel.text = product.title
        self.priceLabel.text = String(format: "%.2f", product.price)
        self.newLabel.text = "NEW"
        self.newLabel.isHidden = !product.isNewProduct
    }
    
    func setFont(){
        self.titleLabel.font = FontStyle.Helvetica(size: 13)
        self.priceLabel.font = FontStyle.HelveticaBold(size: 17)
        self.newLabel.font = FontStyle.MontserratBold(size: 8)
    }
    
    func setColor(){
        self.contentView.backgroundColor = ColorPallete.white
        self.imageView.backgroundColor = ColorPallete.white
        self.titleLabel.textColor = ColorPallete.veryDarkGray
        self.priceLabel.textColor = ColorPallete.red
        self.newLabel.textColor = ColorPallete.red
    }
    
    func setCornerRadiusAndShadow(){
        self.contentView.layer.cornerRadius = 9
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = ColorPallete.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.62
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }
}
