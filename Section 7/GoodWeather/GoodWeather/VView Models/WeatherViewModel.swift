//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Rhony Abdullah Siagian on 20/12/22.
//

import Foundation
import OSLog


class WeatherViewModel: ObservableObject {

    private var weatherService: WeatherService

    @Published var weather = Weather()

    init() {
        self.weatherService = WeatherService()
    }

    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }

    var humidity: String {
        if let humidity = self.weather.humidity {
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
    }

    var cityName: String = ""

    func search() {
        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }

    private func fetchWeather(by city: String) {
        Logger().debug("try to search city, city name: \(city)")
        weatherService.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    Logger().debug("search executed")
                    self.weather = weather
                }
            }
        }
    }

}
