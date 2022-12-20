//
//  WebService.swift
//  CoffeOrdering
//
//  Created by Rhony Abdullah Siagian on 20/12/22.
//

import Foundation

class WebService {

    private let baseURL = "https://island-bramble.glitch.me"

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
            
            let orders = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async {
                completion(orders)
            }
            
        }.resume()
    }
}
