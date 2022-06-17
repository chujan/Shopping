//
//  CartTableViewCell.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 12/06/2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
   static let identifier = "CartTableViewCell"
    
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    func setup(cart: Cart) {
        addressLabel.text = cart.address.city
        nameLabel.text = cart.name.firstname
        emailLabel.text = cart.email
        phoneLabel.text = cart.phone
        lastNameLabel.text = cart.name.lastname
        passwordLabel.text = cart.password
        
        
        
    }
    

    

    
}

//extension Date {
//    static func getFormattedDate(string: String , formatter:String) -> String{
//        let dateFormatterGet = DateFormatter()
//        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//
//        let dateFormatterPrint = DateFormatter()
//        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
//
//        let date: Date? = dateFormatterGet.date(from: "2018-02-01T19:10:04+00:00")
//        print("Date",dateFormatterPrint.string(from: date!)) // Feb 01,2018
//        return dateFormatterPrint.string(from: date!);
//    }
//}

extension Int {
    var stringValue:String {
        return "\(self)"
    }
    
    
}

extension Array {
    mutating func remove(where condition: (Element) -> Bool) -> Element? {
        guard let index = firstIndex(where: condition) else {
            return nil
        }

        return remove(at: index)
    }
}





