//
//  LocationManager.swift
//  NearMe
//
//  Created by Rhony Abdullah Siagian on 03/01/23.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject {

    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func startLocationUpdate() {
        locationManager.startUpdatingLocation()
    }
    
    func stopLocationUpdate() {
        locationManager.stopUpdatingLocation()
    }

}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.location = location
    }
}
