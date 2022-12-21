//
//  WebService.swift
//  CoffeOrdering
//
//  Created by Rhony Abdullah Siagian on 20/12/22.
//

import Foundation

class WebService {

    private let baseURL = "https://helpful-rebel-system.glitch.me"

    func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> ()) {
        guard let url = URL(string: "\(baseURL)/orders") else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            let response = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            DispatchQueue.main.async {
                completion(response)
            }

        }.resume()
    }

    func getAllOrders(completion: @escaping([Order]?) -> ()) {

        guard let url = URL(string: "\(baseURL)/orders") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            let response = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion(response)
            }

        }.resume()
    }
}
