//
//  ContentView.swift
//  Gestures
//
//  Created by Rhony Abdullah Siagian on 21/12/22.
//

import SwiftUI

struct ContentView: View {

    @State private var tapped: Bool = false
    @State private var dragState = CGSize.zero
    @State private var rotateState: Double = 0

    var body: some View {
        Card(tapped: tapped)
            .animation(.linear(duration: 0.5), value: dragState.animatableData.first)
            .offset(x: dragState.width, y: dragState.height)
            .rotationEffect(Angle(degrees: rotateState))
            .gesture(RotationGesture()
                .onChanged { value in
                rotateState = value.degrees
            })
            .gesture(
            DragGesture()
                .onChanged { value in
                    dragState = value.translation
                }.onEnded { _ in
                    dragState = CGSize.zero
                })
            .gesture(
            TapGesture(count: 1)
                .onEnded({ _ in
                tapped.toggle()
            })
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
