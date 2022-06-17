//
//  CartViewController.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 12/06/2022.
//

import UIKit
import ProgressHUD

class CartViewController: UIViewController {
    var carts = [Cart]()
    var dateFormatterGet = DateFormatter()
    
    
    @IBOutlet weak var cartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        cartTableView.delegate = self
        cartTableView.dataSource = self
        ProgressHUD.show()
    
       
        
        ApiCaller.shared.fetchCart { [weak self] result in
            ProgressHUD.dismiss()
            switch result {
               
                
            case .success(let cart):
                DispatchQueue.main.async {
                    self?.carts = cart
                    //print(<#T##items: Any...##Any#>)
                self?.cartTableView.reloadData()
                }
                   
                
            case .failure(let error):
                print("Fetching failed with:\(error)")
            }
        
        }

       
    }
    
    
    private func registerCells() {
        cartTableView.register(UINib(nibName: CartTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CartTableViewCell.identifier)
    }

}
extension CartViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        carts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier) as! CartTableViewCell
        cell.setup(cart: carts[indexPath.row])
        
        return cell
    }
    
    
}
