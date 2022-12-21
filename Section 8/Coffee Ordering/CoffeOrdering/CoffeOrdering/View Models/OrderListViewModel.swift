//
//  OrderListViewModel.swift
//  CoffeOrdering
//
//  Created by Rhony Abdullah Siagian on 20/12/22.
//

import Foundation

class OrderListViewModel: ObservableObject {

    private let webService: WebService

    @Published var orders = [OrderViewModel]()

    init() {
        self.webService = WebService()
        fetchOrders()
    }

    func fetchOrders() {
        webService.getAllOrders() { orders in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }

}

class OrderViewModel {

    let id = UUID()

    private let order: Order

    init(order: Order) {
        self.order = order
    }

    var name: String {
        return self.order.name
    }

    var size: String {
        return self.order.size
    }

    var coffee: String {
        return self.order.coffeeName
    }

}
