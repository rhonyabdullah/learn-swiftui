//
//  LandmarkCategoryView.swift
//  NearMe
//
//  Created by Rhony Abdullah Siagian on 04/01/23.
//

import SwiftUI

struct LandmarkCategoryView: View {

    private let categories = ["Groceries", "Hotels", "Mall", "Coffee", "Gas", "Pharmacies", "Hotel", "Recreation"]
    @State private var selectedCategory = ""
    private let catForeInActive = Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))
    private let catBackActive = Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    private let catBackInActive = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))

    let callback: (String) -> ()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        selectedCategory = category
                        callback(selectedCategory)
                    }, label: {
                        Text(category)
                    }).padding(10)
                        .foregroundColor(selectedCategory == category ? Color.white : catForeInActive)
                        .background(selectedCategory == category ? catBackActive : catBackInActive)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
        }
    }
}

struct LandmarkCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkCategoryView(callback: { _ in })
    }
}
