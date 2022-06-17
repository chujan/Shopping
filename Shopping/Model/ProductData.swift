//
//  ProductData.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 03/06/2022.
//

import Foundation
struct ProductData: Codable{
    let product: Products
    
    
}
struct Products: Codable {
    let id: Int
    let title: String?
    let price: Double
    let apiResponseDescription: String
    let category: Category
    let image: String
    let rating: Rating

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case apiResponseDescription = "description"
        case category, image, rating
    }
}

enum Category: String, Codable, CaseIterable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

typealias products = [Products]

