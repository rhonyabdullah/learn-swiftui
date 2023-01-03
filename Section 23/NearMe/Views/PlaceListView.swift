//
//  PlaceListView.swift
//  NearMe
//
//  Created by Rhony Abdullah Siagian on 03/01/23.
//

import SwiftUI

struct PlaceListView: View {

    let landmarks: [Landmark]
    var onTap: () -> ()

    var body: some View {
        VStack {

            HStack {
                EmptyView()
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 60)
                .background(Color.blue)
                .gesture(TapGesture()
                .onEnded(self.onTap)
            )

            List(self.landmarks, id: \.id) { landmark in
                Text(landmark.name)
            }.animation(nil)

        }.cornerRadius(16)
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [Landmark](), onTap: { })
    }
}
