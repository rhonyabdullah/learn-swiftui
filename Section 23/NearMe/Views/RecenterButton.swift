//
//  RecenterButton.swift
//  NearMe
//
//  Created by Rhony Abdullah Siagian on 04/01/23.
//

import SwiftUI

struct RecenterButton: View {

    let onTapped: () -> Void

    private let bgColor = Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))

    var body: some View {
        Button(action: {
            onTapped()
        }, label: {
            Label("Re-Center", systemImage: "triangle.circle.fill")
        }).padding(10)
            .foregroundColor(Color.white)
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct RecenterButton_Previews: PreviewProvider {
    static var previews: some View {
        RecenterButton(onTapped: { })
    }
}
