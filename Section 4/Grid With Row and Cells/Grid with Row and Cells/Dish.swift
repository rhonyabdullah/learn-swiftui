//
//  Dish.swift
//  Grid with Row and Cells
//
//  Created by Rhony on 24/11/20.
//

import Foundation

struct Dish: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let imageUrl: String
}

extension Dish {
    static func all() -> [Dish] {
        return [
            Dish(name: "Filet", price: 35.5, imageUrl: "filet"),
            Dish(name: "Spaget", price: 10, imageUrl: "spaget"),
            Dish(name: "Sushi", price: 17.2, imageUrl: "sushi"),
            Dish(name: "Swift", price: 17.2, imageUrl: "image"),
            Dish(name: "Swift", price: 17.2, imageUrl: "filet"),
            Dish(name: "Filet", price: 35.5, imageUrl: "filet"),
            Dish(name: "Spaget", price: 10, imageUrl: "spaget"),
            Dish(name: "Sushi", price: 17.2, imageUrl: "sushi"),
            Dish(name: "Swift", price: 17.2, imageUrl: "image"),
            Dish(name: "Swift", price: 17.2, imageUrl: "filet")
        ]
    }
}
