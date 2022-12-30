//
//  Store.swift
//  WeatherAppSwiftUI
//
//  Created by Rhony Abdullah Siagian on 30/12/22.
//

import Foundation

class Store: ObservableObject {

    @Published var weatherList = [WeatherViewModel]()

    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }
    
}

#if DEBUG
extension Store {
    
    func setupPreview() {
        weatherList = [
            WeatherViewModel(
                weather: Weather(city: "Jakarta", temperature: 30.0, icon: "04d", sunrise: .now, sunset: .now)
            )
        ]
    }
}
#endif
