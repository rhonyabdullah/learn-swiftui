//
//  Landmark.swift
//  NearMe
//
//  Created by Rhony Abdullah Siagian on 03/01/23.
//

import Foundation
import MapKit

struct Landmark {

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
