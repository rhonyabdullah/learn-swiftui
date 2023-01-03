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

    let landmarks: [Landmark]

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
        updateAnnotations(from: uiView)
    }

    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations)
    }

}
