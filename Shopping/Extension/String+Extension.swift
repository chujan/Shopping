//
//  String+Extension.swift
//  Shopping
//
//  Created by Jennifer Chukwuemeka on 05/06/2022.
//

import Foundation
extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
