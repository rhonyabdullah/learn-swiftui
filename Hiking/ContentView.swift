//
//  ContentView.swift
//  Hiking
//
//  Created by Rhony Abdullah Siagian on 12/12/22.
//

import SwiftUI

struct ContentView: View {

    let animals = ["🐨", "🐰", "🐮", "🐯", "🐴", "🐔", "🦆"]
    @State private var sliderValue: CGFloat = 1

    var body: some View {
        NavigationView {
            VStack {
                Slider(value: $sliderValue, in: 1...8, step: 1)
                Text(String(format: "%.0f", self.sliderValue))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(Color.yellow)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .clipShape(Circle())

                List(self.animals.chunks(size: Int(self.sliderValue)),
                    id: \.self) { chunk in
                    ForEach(chunk, id: \.self) { animal in
                        HStack {
                            Text(
                                "count: \(chunk.count) \(animal)"
                            )
                        }
                    }
                }
            }.navigationBarTitle("Animals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
