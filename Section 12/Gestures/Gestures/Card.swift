//
//  Card.swift
//  Gestures
//
//  Created by Rhony Abdullah Siagian on 21/12/22.
//
import Foundation
import SwiftUI

struct Card: View {

    let tapped: Bool
    @State private var scale: CGFloat = 1
    

    var body: some View {

        VStack {

            Image("Cappuccino")
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(8)
                .scaleEffect(scale)
                .gesture(MagnificationGesture()
                    .onChanged { value in
                    scale = value.magnitude
                })

            Text("Card")
                .font(.largeTitle)
                .foregroundColor(Color.white)

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(tapped ? Color.orange : Color.indigo)
            .cornerRadius(30)

    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(tapped: false)
    }
}
