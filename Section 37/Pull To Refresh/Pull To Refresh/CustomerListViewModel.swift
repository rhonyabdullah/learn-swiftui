//
//  CustomerListViewModel.swift
//  SwiftUIDefaultBasicAnimation
//
//  Created by Rhony Abdullah Siagian on 27/12/22.
//  Copyright © 2022 Mohammad Azam. All rights reserved.
//

import Foundation
import OSLog

class CustomerListViewModel: ObservableObject {

    @Published var customers = [String]()

    func fetch() {
        let letters = "abcdefghijkl"
        var names = [String]()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            for _ in 0...10 {
                let randomName = String((0...letters.count).map { _ in letters.randomElement()! })
                names.append(randomName)
            }
            self.customers = names
        }
        
        Logger().debug("Customers fetched: \(self.customers)")
    }

}
