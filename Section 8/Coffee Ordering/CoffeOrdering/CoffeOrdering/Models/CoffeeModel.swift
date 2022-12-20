//
//  CoffeeModel.swift
//  CoffeOrdering
//
//  Created by Rhony Abdullah Siagian on 20/12/22.
//

import Foundation

struct Coffee {
    let name: String
    let imageURL: String
    let price: Double
}

extension Coffee {
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappucino", imageURL: "Cappucino", price: 2.5),
            Coffee(name: "Espresso", imageURL: "Espresso", price: 4.5),
            Coffee(name: "Regular", imageURL: "Robusta", price: 7.1)
        ]
    }
}
