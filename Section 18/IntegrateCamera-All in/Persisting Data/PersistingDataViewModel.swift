//
//  PersistingDataViewModel.swift
//  IntegrateCamera
//
//  Created by Rhony Abdullah Siagian on 27/12/22.
//

import Foundation

class PersistingDataViewModel: ObservableObject {
    
    @Published var isOn: Bool = UserDefaults.standard.bool(forKey: "isOn") {
        didSet {
            UserDefaults.standard.set(isOn, forKey: "isOn")
        }
    }
    
}
