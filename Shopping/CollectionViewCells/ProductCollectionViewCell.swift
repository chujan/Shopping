//
//  ProductCollectionViewCell.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 04/06/2022.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: ProductCollectionViewCell.self)

  
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productTittleLabel: UILabel!
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    
   
    
    func setup(with product: Products) {
        productTittleLabel.text = product.title
        productImageView.kf.setImage(with:product.image.asUrl)
        Category.allCases.forEach { _ in
            categoryLabel.text = product.category.rawValue
        }
           
        
        
       
        
    }
}
