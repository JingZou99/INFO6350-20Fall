//
//  Cart.swift
//  LoginApp
//
//  Created by Jing Zou on 12/17/20.
//

import Foundation

class ShoppinnCart {
    
    private(set) var items : [CartItem] = []
}

extension ShoppinnCart {
    var total: Float {
        get { return items.reduce(0.0) { value, item in
            value + item.subTotal
            }
        }
    }
    
    var totalQuantity : Int {
        get { return items.reduce(0) { value, item in
            value + item.quantity
            }
        }
    }
    
    func updateCart(with product: Product) {
        if !self.contains(product: product) {
            self.add(product: product)
        } else {
            self.removeProduct(product: product)
        }
    }
    
    func updateCart() {
        
        for item in self.items {
            if item.quantity == 0 {
                updateCart(with: item.product)
            }
        }
    }
    
    func add(product: Product) {
        let item = items.filter { $0.product == product }
        
        if item.first != nil {
            item.first!.quantity += 1
        } else {
            items.append(CartItem(product: product))
        }
    }
    
    func removeProduct(product: Product) {
        guard let index = items.index(where: { $0.product == product }) else { return}
        items.remove(at: index)
    }
    
    func contains(product: Product) -> Bool {
        let item = items.filter { $0.product == product }
        return item.first != nil
    }
}
