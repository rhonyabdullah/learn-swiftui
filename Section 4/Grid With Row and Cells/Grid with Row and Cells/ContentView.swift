//
//  ContentView.swift
//  Grid with Row and Cells
//
//  Created by Rhony on 24/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(0 ..< 5) { _ in
                HStack {
                    ForEach(0 ..< 2) { subIdx in
                        Image("image")
                            .resizable()
                            .scaledToFit()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
