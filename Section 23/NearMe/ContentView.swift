//
//  ContentView.swift
//  TabBar
//
//  Created by Rhony Abdullah Siagian on 13/12/22.
//

import SwiftUI
import MapKit
import OSLog

struct ContentView: View {

    private var locationManager = LocationManager()
    @State private var search: String = ""
    @State private var landmarks = [Landmark]()
    @State private var tapped: Bool = false

    var body: some View {
        ZStack(alignment: .top) {
            MapView(landmarks: landmarks)

            TextField("Search", text: $search, onEditingChanged: { _ in }) {
                getNearByLandmarks()
            }.textFieldStyle(.roundedBorder)
                .padding([.top], 56)
                .padding([.leading, .trailing], 16)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)

            PlaceListView(landmarks: landmarks, onTap: {
                tapped.toggle()
            }).animation(.spring())
                .offset(y: calculateOffset())

        }.ignoresSafeArea()
    }

    private func getNearByLandmarks() {


        guard let location = locationManager.location else {
            return
        }

        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        request.region = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000
        )

        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            os_log("response received")
            guard let response = response, error == nil else {
                return
            }

            let mapItem = response.mapItems
            self.landmarks = mapItem.map {
                os_log("item: \($0)")
                return Landmark(placemark: $0.placemark)
            }
        }

    }

    func calculateOffset() -> CGFloat {

        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
        } else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
