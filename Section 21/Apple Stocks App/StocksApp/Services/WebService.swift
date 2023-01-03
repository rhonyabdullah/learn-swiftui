//
//  WebService.swift
//  StocksApp
//
//  Created by Rhony Abdullah Siagian on 02/01/23.
//

import Foundation

class WebService {

    private let getStocksUrl = "https://island-bramble.glitch.me/stocks"

    func getStocks(completion: @escaping (([Stock]?) -> Void)) {

        guard let url = URL(string: getStocksUrl) else {
            fatalError("URL is not correct")
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)

        }.resume()
    }
}
