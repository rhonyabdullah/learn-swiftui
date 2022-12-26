//
//  OrderListViewModel.swift
//  HotCoffeeApp
//
//  Created by Rhony Abdullah Siagian on 26/12/22.
//

import Foundation
import OSLog

class OrderListViewModel: ObservableObject {

    private var coreData: CoreDataManager {
        return CoreDataManager.shared
    }

    @Published var orders = [OrderViewModel]()

    init() {
        fetchAllORders()
    }

    func fetchAllORders() {
        orders = coreData.getOrders().map(OrderViewModel.init)
    }
    
    func deleteOrder(_ model: OrderViewModel) {
        coreData.deleteOrder(name: model.name)
        fetchAllORders()
    }

}

struct OrderViewModel: Hashable {

    let name: String
    let type: String

    init(order: Order) {
        self.name = order.name!
        self.type = order.type!
    }
}
