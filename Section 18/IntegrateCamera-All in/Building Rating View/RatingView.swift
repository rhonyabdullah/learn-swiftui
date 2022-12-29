//
//  RatingView.swift
//  IntegrateCamera
//
//  Created by Rhony Abdullah Siagian on 27/12/22.
//

import SwiftUI

struct RatingView: View {

    @Binding var rating: Int?

    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: ratingType(index: index))
                    .foregroundColor(Color.orange)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }

    private func ratingType(index: Int) -> String {
        if let type = rating {
            return index <= type ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
}

struct LibraryContent : LibraryContentProvider {
    
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(
            RatingView(rating: .constant(3)),
            title: "Rating Control",
            category: .control
        )
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
