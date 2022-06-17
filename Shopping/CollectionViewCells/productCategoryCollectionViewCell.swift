//
//  productCategoryCollectionViewCell.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 07/06/2022.
//

import UIKit

class productCategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifer = String(describing: productCategoryCollectionViewCell.self)
    
    

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var decriptionLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    func setup(with items: CategoryElement ) {
        titleLabel.text = items.title
        categoryImageView.kf.setImage(with: items.image.asUrl)
        priceLabel.text = items.price.formatted()
        categoryLabel.text = items.category
        decriptionLabel.text = items.categoryDescription
        ratingLabel.text = items.rating.rate.formatted()
        
        
    }
}
