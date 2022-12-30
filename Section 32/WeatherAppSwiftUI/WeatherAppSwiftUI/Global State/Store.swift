//
//  Store.swift
//  WeatherAppSwiftUI
//
//  Created by Rhony Abdullah Siagian on 30/12/22.
//

import Foundation

class Store: ObservableObject {

    @Published var selectedUnit = TemperatureUnit.kelvin
    @Published var weatherList = [WeatherViewModel]()
    
    init() {
        selectedUnit = UserDefaults.standard.unit
    }

    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }
    
}

#if DEBUG
extension Store {
    
    func setupPreview() {
        weatherList = [
            WeatherViewModel(
                weather: Weather(city: "Jakarta", temperature: 302.0, icon: "04d", sunrise: .now, sunset: .now)
            )
        ]
    }
}
#endif
