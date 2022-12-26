//
//  AddOrderViewModel.swift
//  HotCoffeeApp
//
//  Created by Rhony Abdullah Siagian on 23/12/22.
//

import Foundation

class AddOrderViewModel {

    private var coreData: CoreDataManager {
        return CoreDataManager.shared
    }
    
    var name: String = ""
    var type: String = ""

    func saveOrder() {
        coreData.saveOrder(name: name, type: type)

    }

}
