//
//  RatingContentView.swift
//  IntegrateCamera
//
//  Created by Rhony Abdullah Siagian on 27/12/22.
//

import SwiftUI

struct RatingContentView: View {

    @State var rating: Int?

    var body: some View {
        VStack {
            RatingView(rating: $rating)
            Text(rating != nil ? "You rating: \(rating!)" : "")
        }
    }
}

struct RatingContentView_Previews: PreviewProvider {
    static var previews: some View {
        RatingContentView()
    }
}
