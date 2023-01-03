//
//  MapView.swift
//  NearMe
//
//  Created by Rhony Abdullah Siagian on 03/01/23.
//
import Foundation
import SwiftUI
import MapKit
import UIKit

struct MapView: UIViewRepresentable {

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {

    }

}
