//
//  ContentView.swift
//  TabBar
//
//  Created by Rhony Abdullah Siagian on 13/12/22.
//

import SwiftUI
import MapKit

enum DisplayType: Identifiable {
    var id: Self { self }
    case map
    case list
}

struct ContentView: View {

    private var locationManager = LocationManager()
    @State private var search: String = ""

    @State private var tapped: Bool = false
    @StateObject private var viewModel = PlaceListViewModel()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var displayType: DisplayType = .map
    @State private var selectedCategory: String = ""
    @State private var isDragging = false

    var body: some View {
        VStack {

            TextField("Search", text: $search, onCommit: {
                searchLandmark()
            }).textFieldStyle(.roundedBorder)
                .padding([.top], 56)
                .padding([.leading, .trailing], 16)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)

            LandmarkCategoryView(callback: { selectedCategory in
                search = selectedCategory
                searchLandmark()
            }).padding(.leading, 16)

            Picker("Display Typ", selection: $displayType) {
                Text("Map").tag(DisplayType.map)
                Text("List").tag(DisplayType.list)
            }.pickerStyle(.segmented)
                .padding([.leading, .trailing], 16)

            if displayType == .map {
                Map(
                    coordinateRegion: getRegion(),
                    interactionModes: .all,
                    showsUserLocation: true,
                    userTrackingMode: $userTrackingMode,
                    annotationItems: viewModel.landmarks
                ) { landmark in
                    MapAnnotation(coordinate: landmark.coordinate, content: {
                        VStack() {
                            Text(landmark.name)
                                .font(.footnote)
                                .foregroundColor(Color.cyan)
                                .padding(0)
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(Color.orange)
                                .frame(width: 30, height: 30)
                        }
                    })
                }.gesture(DragGesture().onChanged({ _ in
                    isDragging = true
                })).overlay(alignment: .bottom, content: {
                    isDragging ? AnyView(
                        RecenterButton(onTapped: {
                            viewModel.startLocationUpdate()
                            isDragging = false
                        }).padding(.bottom, 16))
                    : AnyView(EmptyView())
                })

            } else if displayType == .list {
                LandmarkListView(landmarks: viewModel.landmarks)
            }

        }.ignoresSafeArea()
    }

    private func getRegion() -> Binding<MKCoordinateRegion> {

        guard let coordinate = viewModel.currentLocation else {
            return .constant(MKCoordinateRegion.defaultRegion)
        }

        return .constant(MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    }

    private func searchLandmark() {
        viewModel.searchLandmarks(search: search)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
