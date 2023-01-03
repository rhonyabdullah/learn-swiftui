//
//  Stocks.swift
//  StocksApp
//
//  Created by Rhony Abdullah Siagian on 02/01/23.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Int
    let change: String
}
