//
//  MKCoordinateRegion.swift
//  NearMe
//
//  Created by Rhony Abdullah Siagian on 04/01/23.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    
    static var defaultRegion: MKCoordinateRegion {
        return MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 1.3452403806144473,longitude: 103.98323903104303),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    }
    
}
