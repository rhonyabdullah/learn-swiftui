//
//  LandmarkListView.swift
//  NearMe
//
//  Created by Rhony Abdullah Siagian on 04/01/23.
//

import SwiftUI

struct LandmarkListView: View {

    let landmarks: [Landmark]

    var body: some View {
        List(landmarks, id: \.id) { landmark in
            VStack(alignment: .leading, spacing: 12) {
                Text(landmark.name)
                    .font(.headline)
                Text(landmark.title)
                    .font(.title)
            }
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView(landmarks: Landmark.preview)
    }
}
