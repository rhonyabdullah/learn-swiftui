//
//  StockService.swift
//  TabBar
//
//  Created by Rhony Abdullah Siagian on 28/12/22.
//

import Foundation

class StockService {
    func getStocks(completion: @escaping ([Stock]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            let stocks = [
                Stock(name: "Apple", price: Double.random(in: 100...200)),
                Stock(name: "Google", price: Double.random(in: 1000...2000)),
                Stock(name: "Microsoft", price: Double.random(in: 600...7000)),
            ]
            completion(stocks)
        }
    }

    func getStocks() async -> [Stock] {
        await withUnsafeContinuation { continuation in
            getStocks { result in
                continuation.resume(returning: result)
            }
        }
    }
}

struct Stock {
    let name: String
    let price: Double
}
