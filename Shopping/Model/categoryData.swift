//
//  categoryData.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 07/06/2022.
//

import Foundation
struct categoryData: Codable{
    let items: CategoryElement
}
    
    struct CategoryElement: Codable {
        
        let id: Int
        let title: String
        let price: Double
        let categoryDescription, category: String?
        let image: String
        let rating: Rating

        enum CodingKeys: String, CodingKey {
            
            case id, title, price
            case categoryDescription = "description"
            case category, image,rating
        }
    }
extension Double {
    var string: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 5
        formatter.roundingMode = .floor
        return formatter.string(for: self) ?? description
    }
}




   //MARK: - Rating
//    struct Rating: Codable {
//        let rate: Double
//        let count: Int
//    }
//
//    typealias Category = [CategoryElement]

    

