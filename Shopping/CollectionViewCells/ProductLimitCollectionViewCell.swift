//
//  ProductLimitCollectionViewCell.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 09/06/2022.
//

import UIKit

class ProductLimitCollectionViewCell: UICollectionViewCell {
    static let identifer = String(describing: ProductLimitCollectionViewCell.self)

    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var limitImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
   // @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    func setup(limits: LimitElement) {
        titlelabel.text = limits.title
        limitImageView.kf.setImage(with: limits.image.asUrl)
        descriptionLabel.text = limits.category
//        priceLabel.text = limits.price.formatted()
        ratingLabel.text = limits.rating.rate.formatted()
        
    }
    

}
