//
//  ListProductViewController.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 14/06/2022.
//

import UIKit
import ProgressHUD

class ListProductViewController: UIViewController {
    var products = [Products]()
    var prod : Products!

    @IBOutlet weak var listProductTableView: UITableView!
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show()
        
       // title = pro.self
        registerCells()
        listProductTableView.delegate = self
        listProductTableView.dataSource = self
        ApiCaller.shared.fetch { [weak self] result in
            ProgressHUD.dismiss()
            switch result {
                
            case .success(let item):
                DispatchQueue.main.async {
                    self?.products = item
                    self?.listProductTableView.reloadData()
                }
                
            case.failure(let error):
                print("Fetching failed with: \(error)")
                
            }
        }

    

   

}
    private func registerCells() {
        listProductTableView.register(UINib(nibName: ListProductTableViewCell.identifer, bundle: nil), forCellReuseIdentifier: ListProductTableViewCell.identifer)
    }
    
    
    
    
}
extension ListProductViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListProductTableViewCell.identifer) as! ListProductTableViewCell
        cell.configure(product: products[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ProductDetailViewController.instantiate()
        controller.product = products[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
