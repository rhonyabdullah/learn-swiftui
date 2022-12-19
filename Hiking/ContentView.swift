//
//  ContentView.swift
//  Hiking
//
//  Created by Rhony Abdullah Siagian on 12/12/22.
//

import SwiftUI

struct ContentView: View {

    var models = Dish.all()
    @State private var isSpicy = false

    var body: some View {
        VStack {
            Toggle(isOn: $isSpicy) {
                Text("Spicy")
                    .font(.title2)
            }
            List {
                ForEach(models.filter { $0.isSpicy == self.isSpicy }) { model in
                    HStack {
                        Image(model.imageURL)
                            .resizable()
                            .frame(width: 100, height: 100)

                        Text(model.name)
                            .font(.title2)
                            .lineLimit(2)

                        Spacer()

                        if(model.isSpicy) {
                            Image("spicy-icon")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                    }
                }
            }
        }
    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
#endif
