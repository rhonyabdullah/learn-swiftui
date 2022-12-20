//
//  ContentView.swift
//  GoodWeather
//
//  Created by Rhony Abdullah Siagian on 19/12/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: WeatherViewModel

    init() {
        self.viewModel = WeatherViewModel()
    }

    var body: some View {
        VStack(alignment: .center) {

            TextField("Enter City Name", text: $viewModel.cityName) {
                viewModel.search()
            }.font(.title)
                .fixedSize() //make the text field on center
            .multilineTextAlignment(.center)

            Text(viewModel.temperature)
                .font(.custom("Arial", size: 100))
                .foregroundColor(Color.white)


        }.frame(
            minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity
        ).background(
            Color.green
        ).edgesIgnoringSafeArea(
                .all
        )

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
