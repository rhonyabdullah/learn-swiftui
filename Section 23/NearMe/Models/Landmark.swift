//
//  Landmark.swift
//  NearMe
//
//  Created by Rhony Abdullah Siagian on 03/01/23.
//

import Foundation
import MapKit

struct Landmark: Identifiable {

    let placemark: MKPlacemark

    var id: UUID {
        return UUID()
    }

    var name: String {
        placemark.name ?? ""
    }

    var title: String {
        placemark.title ?? ""
    }

    var coordinate: CLLocationCoordinate2D {
        placemark.coordinate
    }

}

#if DEBUG
    extension Landmark {
        static let preview: [Landmark] = [
            Landmark(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 1.3452403806144473, longitude: 103.98323903104303)))
        ]

    }
#endif
