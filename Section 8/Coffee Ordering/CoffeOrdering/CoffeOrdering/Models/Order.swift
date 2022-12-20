//
//  Order.swift
//  CoffeOrdering
//
//  Created by Rhony Abdullah Siagian on 20/12/22.
//

import Foundation

struct Order: Codable {
    let name: String
    let coffeeName: String
    let total: Double
    let size: String
}
