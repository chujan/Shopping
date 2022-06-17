//
//  categoryCollectionViewCell.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 15/06/2022.
//

import UIKit

class categoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "categoryCollectionViewCell"
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    
    func configure(cart: String) {
        categoryLabel.text = cart
        
    }
    
}
