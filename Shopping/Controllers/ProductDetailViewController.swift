//
//  ProductDetailViewController.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 10/06/2022.
//

import UIKit
import ProgressHUD

class ProductDetailViewController: UIViewController {

   
   
    var product : Products!
    var items: CategoryElement!
    var limits: LimitElement!
   
    
   
    
  
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    

    
    
    @IBAction func placeOrder(_ sender: UIButton) {
        let controller = CartViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
        
        
       
        
       
       
        
        
        
        

       
    }
    
    
 
    
    private func populateView()  {
        
        
       
        if (product != nil) {
            imageView.kf.setImage(with: product.image.asUrl)
            titleLabel.text = product.title
            priceLabel.text = product.price.formatted()
            descriptionLabel.text = product.apiResponseDescription
            ratingLabel.text = product.rating.rate.formatted()
             
            
       
            
        } else if (items != nil){
            imageView.kf.setImage(with: items.image.asUrl)
            titleLabel.text = items.title
            priceLabel.text = items.price.formatted()
            descriptionLabel.text = items.categoryDescription
            ratingLabel.text = items.rating.rate.formatted()
            
        
        } else if (limits != nil){
        imageView.kf.setImage(with: limits.image.asUrl)
        titleLabel.text = limits.title
        priceLabel.text = limits.price.formatted()
        descriptionLabel.text = limits.limitDescription
        ratingLabel.text = limits.rating.rate.formatted()
            
        } else {
            
        }
        
        
        
        
}
}



    
    

   


