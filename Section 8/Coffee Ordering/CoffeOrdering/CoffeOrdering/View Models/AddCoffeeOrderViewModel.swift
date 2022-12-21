//
//  AddCoffeeOrderViewModel.swift
//  CoffeOrdering
//
//  Created by Rhony Abdullah Siagian on 20/12/22.
//

import Foundation
import OSLog

class AddCoffeeOrderViewModel: ObservableObject {

    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""

    private let service: WebService

    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var total: Double {
        return calculateTotalPrice()
    }

    init() {
        self.service = WebService()
    }
    
    func placeOrder() {
        let order = Order(name: self.name, coffeeName: self.coffeeName, total: self.total, size: self.size)
        service.createCoffeeOrder(order: order) { _ in
            Logger().debug("Order Created")
        }
    }

    private func priceForSize() -> Double {
        let prices = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
        return prices[self.size]!
    }

    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
}
