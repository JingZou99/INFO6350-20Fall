//
//  CartItem.swift
//  LoginApp
//
//  Created by Jing Zou on 12/17/20.
//

import Foundation

class CartItem {
    
    var quantity : Int = 1
    var product : Product
    
    var subTotal : Float { get { return product.price * Float(quantity) } }
    
    init(product: Product) {
        self.product = product
    }
}

