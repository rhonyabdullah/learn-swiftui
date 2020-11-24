//
//  ContentView.swift
//  Grid with Row and Cells
//
//  Created by Rhony on 24/11/20.
//

import SwiftUI

struct ContentView: View {
    let dishes = Dish.all()
    var body: some View {
        let chunked = dishes.chunked(into: 2)

        return List {
            ForEach(0 ..< chunked.count) { index in
                HStack {
                    ForEach(chunked[index]) { dish in
                        Image(dish.imageUrl)
                            .resizable()
                            .scaledToFit()
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
