//
//  HomeViewController.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 04/06/2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    @IBOutlet weak var productCategoryCollectionView: UICollectionView!
    
    @IBOutlet weak var productLimitCollectionView: UICollectionView!
    
    
    
    var products = [Products]()
    var Items = [CategoryElement] ()
    var Limits = [LimitElement]()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        ProgressHUD.show()
       

        ApiCaller.shared.fetch { [weak self] result in
            switch result {
            case .success(let item):
                ProgressHUD.dismiss()
                DispatchQueue.main.async {
                    self?.products = item
                   // print(item)
                    self?.productCollectionView.reloadData()
                }
               
            case .failure(let error):
                print("Fetching failed with: \(error)")
                
            }
        }
        
        ApiCaller.shared.fetchCategory {[weak self] result in
            switch result {
            case .success(let product):
                DispatchQueue.main.async {
                    self?.Items = product
                   // print(product)
                    self?.productCategoryCollectionView.reloadData()
                }
            case.failure(let error):
                print("Fetching failed with: \(error)")
                
                
            }
        }
        ApiCaller.shared.fetchLimit { [weak self]  result in
            switch result {
            case.success(let limits):
                DispatchQueue.main.async {
                    self?.Limits = limits
                    //print(limits)
                    self?.productLimitCollectionView.reloadData()
                }
            case.failure(let error):
                print("Fetching failed with: \(error)")
            }
        }
        
    }

    
    private func registerCells() {
        productCollectionView.register(UINib(nibName: ProductCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        
        
        productCategoryCollectionView.register(UINib(nibName: productCategoryCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: productCategoryCollectionViewCell.identifer)
        
        productLimitCollectionView.register(UINib(nibName: ProductLimitCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: ProductLimitCollectionViewCell.identifer)
        
        
    }
    

   

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case productCollectionView:
            return products.count
        case productCategoryCollectionView:
           return Items.count
        case productLimitCollectionView:
            return Limits.count
        
        default: return 0
        }
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
     case
        productCollectionView:
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        cell.setup(with: products[indexPath.row])
            
        return cell
        case productCategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCategoryCollectionViewCell.identifer, for: indexPath) as! productCategoryCollectionViewCell
            cell.setup(with: Items[indexPath.row])
            return cell
        case productLimitCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductLimitCollectionViewCell.identifer, for: indexPath) as! ProductLimitCollectionViewCell
            cell.setup(limits: Limits[indexPath.row])
            return cell
        default: return UICollectionViewCell()
            
            
            
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == productCollectionView{
            let controller = ListProductViewController.instantiate()
            controller.prod = products[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        }else {
            let controller = ProductDetailViewController.instantiate()
            switch collectionView {
            case productCategoryCollectionView:
                controller.items = Items[indexPath.row]
            case productLimitCollectionView:
                controller.limits = Limits[indexPath.row]
                
            default:
                return
            }
            navigationController?.pushViewController(controller, animated: true)
//       let collectionView = productCategoryCollectionView
//            let controller = ProductDetailViewController.instantiate()
//            controller.items = Items[indexPath.row]
//          //  let collectionView = productLimitCollectionView
//            controller.limits = Limits[indexPath.row]
//            navigationController?.pushViewController(controller, animated: true)
//            //navigationController?.pushViewController(controller, animated: false)
//            //let collectionView = productLimitCollectionView
//            //let controller = ProductDetailViewController.instantiate()
//
            
    }
    
    
    
}
}
