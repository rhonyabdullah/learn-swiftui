//
//  Dish.swift
//  Hiking
//
//  Created by Rhony Abdullah Siagian on 16/12/22.
//

import Foundation

struct Dish: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
    let imageURL: String
    let isSpicy: Bool
}

#if DEBUG
    extension Dish {
        static func all() -> [Dish] {
            return [
                Dish(name: "Fillet Mignon", price: 35, imageURL: "e1", isSpicy: true),
                Dish(name: "Spagetti Meatballs", price: 12, imageURL: "e2", isSpicy: true),
                Dish(name: "Sushi", price: 15, imageURL: "a1", isSpicy: false),
                Dish(name: "Chocolate Cake", price: 8, imageURL: "d1", isSpicy: true),
                Dish(name: "Lemon Cake", price: 10, imageURL: "d2", isSpicy: false),
                Dish(name: "Spagetti", price: 13, imageURL: "e2", isSpicy: false),
            ]
        }
    }
#endif
