//
//  ProductLimit.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 08/06/2022.
//

import Foundation
struct ProductLimit: Codable {
    let  Limits: LimitElement
}
struct LimitElement: Codable {
    let id: Int
    let title: String
    let price: Double
    let limitDescription, category: String
    let image: String
    let rating: Rating

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case limitDescription = "description"
        case category, image, rating
    }
}

// MARK: - Rating
//struct Rating: Codable {
//    let rate: Double?
//    let count: Int?
//}

typealias Limit = [LimitElement]
