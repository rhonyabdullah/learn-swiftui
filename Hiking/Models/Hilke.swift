//
//  Hilke.swift
//  Hiking
//
//  Created by Rhony Abdullah Siagian on 12/12/22.
//

import Foundation

struct Hike {

    let name: String
    let imageURL: String
    let miles: Double

}

#if DEBUG
extension Hike {
    static func single() -> Hike {
        return Hike.all()[1]
    }
    
    static func all() -> [Hike] {
        return [
            Hike(name: "Salmonberry Trail", imageURL: "sal", miles: 6),
            Hike(name: "Tom and Dick", imageURL: "tom", miles: 3.5),
            Hike(name: "Tamanas", imageURL: "tam", miles: 6.7)
        ]
    }
}
#endif
