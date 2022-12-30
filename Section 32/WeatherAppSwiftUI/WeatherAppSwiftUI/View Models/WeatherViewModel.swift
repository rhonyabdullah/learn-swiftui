//
//  WeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Rhony Abdullah Siagian on 30/12/22.
//

import Foundation

struct WeatherViewModel {

    let id = UUID()
    let weather: Weather

    var temperature: Double {
        return weather.temperature
    }

    var city: String {
        return weather.city
    }

    var icon: String {
        return weather.icon
    }

    var sunrise: Date {
        return weather.sunrise
    }

    var sunset: Date {
        return weather.sunset
    }
}
