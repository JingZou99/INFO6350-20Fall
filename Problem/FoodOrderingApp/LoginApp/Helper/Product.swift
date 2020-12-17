//
//  Product.swift
//  LoginApp
//
//  Created by Jing Zou on 12/17/20.
//

import Foundation

struct Product: Codable, Equatable {
    
    var name: String
    var price: Float
    var unit: String
}

extension Product {
    // MARK: Equatable
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price && lhs.unit == rhs.unit
    }
    
    func displayPrice() -> String {
        return String.init(format: "$ %.02f per %@", price, unit)
    }
}


