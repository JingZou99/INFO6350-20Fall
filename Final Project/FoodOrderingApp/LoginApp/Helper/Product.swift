//
//  Product.swift
//  LoginApp
//
//  Created by Jing Zou on 12/17/20.
//

import Foundation

struct Product: Codable, Equatable {
    
    var prodName: String
    var prodPrice: Float
    var prodUnit: String
}

extension Product {
    // MARK: Equatable
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.prodName == rhs.prodName && lhs.prodPrice == rhs.prodPrice && lhs.prodUnit == rhs.prodUnit
    }
    
    func showPrice() -> String {
        return String.init(format: "$ %.02f / %@", prodPrice, prodUnit)
    }
}


