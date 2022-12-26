//
//  AddOrderViewModel.swift
//  HotCoffeeApp
//
//  Created by Rhony Abdullah Siagian on 23/12/22.
//

import Foundation

class AddOrderViewModel {
    
    var name: String = ""
    var type: String = ""
    
    var coreData: CoreDataManager {
        return CoreDataManager.shared
    }

    func saveOrder() {
        coreData.saveOrder(name: name, type: type)
        
    }
    
}
