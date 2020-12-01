//
//  ContentView.swift
//  Using State to Filter List
//
//  Created by Rhony on 01/12/20.
//

import SwiftUI

struct ContentView: View {
    let spicyIcon = "spicy-icon"
    var dishes = Dish.all()

    @State private var isSpicy = false

    var body: some View {
        List {
            Toggle(isOn: $isSpicy) {
                Text("Spicy")
            }
            ForEach(dishes.filter { filtered in
                filtered.isSpicy == self.isSpicy
            }) { dish in
                HStack {
                    Image(dish.imageURL)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 100, height: 100)

                    Text(dish.name)
                        .font(.title)

                    Spacer()

                    if dish.isSpicy {
                        Image(spicyIcon)
                            .resizable()
                            .frame(width: 35, height: 35)
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
