//
//  ProductsListHelper.swift
//  LoginApp
//
//  Created by Jing Zou on 12/17/20.
//

import Foundation

class ProductsListHelper {
    
    private let productsJSON = """
        [
            {
                "name" : "ShakeBurger",
                "price" : 11.48,
                "unit" : "one"
            },
            {
                "name" : "Chicken Burger",
                "price" : 7.55,
                "unit" : "one"
            },
            {
                "name" : "Chicken Bites",
                "price" : 10.48,
                "unit" : "pack"
            },
            {
                "name" : "Hot Dog",
                "price" : 3.50,
                "unit" : "one"
            },
            {
                "name" : "Cheese Burger",
                "price" : 5.99,
                "unit" : "one"
            },
            {
                "name" : "Fries",
                "price" : 3.09,
                "unit" : "pack"
            },
            {
                "name" : "Cheese Fries",
                "price" : 4.09,
                "unit" : "pack"
            },
            {
                "name" : "Iced Tea",
                "price" : 2.88,
                "unit" : "bottle"
            },
            {
                "name" : "Apple Juice",
                "price" : 1.99,
                "unit" : "can"
            },
            {
                "name" : "Milk Tea",
                "price" : 5.75,
                "unit" : "bottle"
            },
            {
                "name" : "Beef Burger",
                "price" : 7.53,
                "unit" : "one"
            },
            {
                "name" : "Caramel Sundae",
                "price" : 2.82,
                "unit" : "one"
            },
            {
                "name" : "Hot Fudge Sundae",
                "price" : 2.92,
                "unit" : "one"
            },
            {
                "name" : "Cookie",
                "price" : 1.17,
                "unit" : "one"
            },
            {
                "name" : "13 Cookie Tote",
                "price" : 8.25,
                "unit" : "pack"
            },
            {
                "name" : "Apple Pie",
                "price" : 1.76,
                "unit" : "one"
            }

        ]
        """.data(using: .utf8)!
    
    func all() -> [Product] {
        let decoder = JSONDecoder()
        let products = try! decoder.decode([Product].self, from: productsJSON)
        
        return products
    }
}
