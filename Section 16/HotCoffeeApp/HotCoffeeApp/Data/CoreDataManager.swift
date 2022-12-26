//
//  CoreDataManager.swift
//  HotCoffeeApp
//
//  Created by Rhony Abdullah Siagian on 23/12/22.
//

import Foundation
import CoreData
import OSLog

class CoreDataManager {

    static let shared = CoreDataManager(moc: PersistenceController.shared.container.viewContext)

    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }

    func getOrders() -> [Order] {
        var orders = [Order]()
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        do {
            orders = try moc.fetch(request)
            Logger().debug("orders count: \(orders.count) found")
        } catch let error as NSError {
            print(error)
        }
        return orders
    }

    func saveOrder(name: String, type: String) {
        let order = Order(context: moc)
        order.type = type
        order.name = name

        do {
            try moc.save()
            Logger().debug("order name: \(name) saved")
        } catch let error as NSError {
            Logger().debug("error on saving order \(error)")
        }
    }

    func deleteOrder(name: String) {
        do {
            if let order = fetchOrder(name: name) {
                moc.delete(order)
                try moc.save()
                Logger().debug("order name: \(name) deleted")
            }
        } catch let error as NSError {
            Logger().debug("error on delete order \(error)")
        }
    }
    
    private func fetchOrder(name: String) -> Order? {
        var orders = [Order]()
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        do {
            orders = try moc.fetch(request)
            Logger().debug("order name: \(name) fetched")
        } catch let error as NSError {
            Logger().debug("error on fetch request \(error)")
        }
        return orders.first(where: { $0.name == name })
    }
    
}
