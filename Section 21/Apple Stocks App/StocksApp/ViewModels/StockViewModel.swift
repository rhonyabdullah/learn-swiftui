//
//  StockViewModel.swift
//  StocksApp
//
//  Created by Rhony Abdullah Siagian on 02/01/23.
//

import Foundation

struct StockViewModel {
    let stock: Stock

    var symbol: String {
        return stock.symbol.uppercased()
    }

    var description: String {
        return stock.description
    }

    var price: String {
        return String(format: "%.2f", stock.price)
    }
    
    var change: String {
        return stock.change
    }
}
