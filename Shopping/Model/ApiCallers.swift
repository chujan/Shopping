//
//  ApiCallers.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 04/06/2022.
//

import Foundation
import UIKit

final class ApiCaller {
    static let shared = ApiCaller()
    
    private init() {}
    
    
    func fetch(completion: @escaping (Result<[Products], Error>) -> Void) {
        guard let url = Constants.productURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let product = try JSONDecoder().decode([Products].self, from: data)
                    completion(.success(product))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
        
    }
    
    func fetchCategory(completion: @escaping(Result<[CategoryElement], Error>) -> Void) {
        guard let url = Constants.categoryURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let Items = try JSONDecoder().decode([CategoryElement].self, from: data)
                    completion(.success(Items))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
        
        
    }
    
    func fetchLimit(completion: @escaping(Result<[LimitElement], Error>) -> Void) {
        guard let url = Constants.limitURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let limit = try JSONDecoder().decode([LimitElement].self, from: data)
                    completion(.success(limit))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func fetchCart(completion: @escaping(Result<[Cart], Error>) -> Void) {
        guard let url = Constants.cartURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ data,response,error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let car = try JSONDecoder().decode([Cart].self, from: data)
                    completion(.success(car))
                } catch let error {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
    }
    
    
    
    func fetchCategoryProduct(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = Constants.categoryProductURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data,response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let item = try JSONDecoder().decode([String].self , from: data)
                    completion(.success(item))
                } catch let error {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
    }
    
  
    
    
}
