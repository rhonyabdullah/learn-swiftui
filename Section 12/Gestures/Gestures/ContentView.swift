//
//  ContentView.swift
//  Gestures
//
//  Created by Rhony Abdullah Siagian on 21/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapped: Bool = false
    
    var body: some View {
       Card(tapped: tapped)
            .gesture(
                TapGesture(count: 1)
                    .onEnded({ Void in
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
