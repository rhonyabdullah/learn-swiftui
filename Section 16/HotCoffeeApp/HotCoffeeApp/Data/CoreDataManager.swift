//
//  CoreDataManager.swift
//  HotCoffeeApp
//
//  Created by Rhony Abdullah Siagian on 23/12/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: PersistenceController.shared.container.viewContext)
    
    var moc: NSManagedObjectContext
    
    func saveOrder(name: String, type: String) {
        let order = Order(context: moc)
        order.type = type
        
        do {
            try moc.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
}
