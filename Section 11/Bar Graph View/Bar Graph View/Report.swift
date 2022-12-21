//
//  Report.swift
//  Bar Graph View
//
//  Created by Rhony Abdullah Siagian on 21/12/22.
//

import Foundation

struct Report : Hashable {
    
    let revenue: Double
    let year: String
    
}

#if DEBUG
extension Report {
    static func all() -> [Report] {
        return [
            Report(revenue: 1500.00, year: "2001"),
            Report(revenue: 3500.00, year: "2002"),
            Report(revenue: 8500.00, year: "2003")
        ]
    }
}
#endif
