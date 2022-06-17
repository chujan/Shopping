//
//  ListProductTableViewCell.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 14/06/2022.
//

import UIKit

class ListProductTableViewCell: UITableViewCell {
    static let identifer = "ListProductTableViewCell"

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var ProductcategoryLabel: UILabel!
    
    
    
    
    
    func configure(product: Products) {
        productImageView.kf.setImage(with: product.image.asUrl)
        TitleLabel.text = product.title
        Category.allCases.forEach { _ in
            ProductcategoryLabel.text = product.category.rawValue
        }
        
        
        
    }
}
