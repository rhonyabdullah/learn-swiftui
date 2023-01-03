//
//  LandmarkAnnotation.swift
//  NearMe
//
//  Created by Rhony Abdullah Siagian on 03/01/23.
//

import Foundation
import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {

    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(landmark: Landmark) {
        title = landmark.name
        coordinate = landmark.coordinate
    }

}
