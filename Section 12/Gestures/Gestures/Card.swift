//
//  Card.swift
//  Gestures
//
//  Created by Rhony Abdullah Siagian on 21/12/22.
//

import SwiftUI

struct Card: View {

    let tapped: Bool

    var body: some View {

        VStack {
            Text("Card")
                .font(.largeTitle)
                .foregroundColor(Color.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(tapped ? Color.orange : Color.purple)
            .cornerRadius(30)

    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(tapped: false)
    }
}
