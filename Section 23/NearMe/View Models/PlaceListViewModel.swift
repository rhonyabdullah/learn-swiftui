//
//  PlaceListViewModel.swift
//  NearMe
//
//  Created by Rhony Abdullah Siagian on 04/01/23.
//

import Foundation
import Combine
import MapKit
import OSLog

class PlaceListViewModel: ObservableObject {

    private let locationManager = LocationManager()
    var cancellable: AnyCancellable?
    @Published var currentLocation: CLLocationCoordinate2D?
    @Published var landmarks: [Landmark] = []

    init() {
        cancellable = locationManager.$location.sink { (location) in
            if let location = location {
                DispatchQueue.main.async {
                    let coordinate = location.coordinate
                    Logger().debug("current location fetched, latitude: \(coordinate.latitude), longitude: \(coordinate.longitude)")
                    self.currentLocation = location.coordinate
                    self.locationManager.stopLocationUpdate()
                }
            }
        }
    }

    func searchLandmarks(search: String) {

        //        guard let location = locationManager.location else {
        //            return
        //        }

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        //        request.region = MKCoordinateRegion(
        //            center: location.coordinate,
        //            latitudinalMeters: 1000,
        //            longitudinalMeters: 1000
        //        )

        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            Logger().debug("response received: \(response)")
            guard let response = response, error == nil else {
                Logger().error("\(error)")
                return
            }

            let mapItem = response.mapItems
            self.landmarks = mapItem.map {
                Logger().debug("item: \($0)")
                return Landmark(placemark: $0.placemark)
            }
        }
    }
    
    func startLocationUpdate() {
        locationManager.startLocationUpdate()
    }
    
}
