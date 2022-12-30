//
//  Weather.swift
//  WeatherAppSwiftUI
//
//  Created by Mohammad Azam on 3/8/21.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let icon: [WeatherIcon]
    let sys: Sys
    let weather: Weather

    private enum CodingKeys: String, CodingKey {
        case name
        case weather = "main"
        case icon = "weather"
        case sys = "sys"
    }

    enum WeatherKeys: String, CodingKey {
        case temperature = "temp"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.icon = try container.decode([WeatherIcon].self, forKey: .icon)
        self.sys = try container.decode(Sys.self, forKey: .sys)

        let weatherContainer = try container.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weather)
        let temperature = try weatherContainer.decode(Double.self, forKey: .temperature)

        self.weather = Weather(city: name, temperature: temperature, icon: icon.first!.icon, sunrise: sys.sunrise, sunset: sys.sunset)
    }
}

struct Sys: Decodable {
    let sunrise: Date
    let sunset: Date

    private enum CodingKeys: String, CodingKey {
        case sunrise = "sunrise"
        case sunset = "sunset"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let sunriseMillis = try container.decode(Int32.self, forKey: .sunrise)
        let sunsetMillis = try container.decode(Int32.self, forKey: .sunset)
        self.sunrise = Date(timeIntervalSince1970: TimeInterval(sunriseMillis))
        self.sunset = Date(timeIntervalSince1970: TimeInterval(sunsetMillis))
    }
}

struct WeatherIcon: Decodable {
    let main: String //"Clouds"
    let description: String
    let icon: String
}

struct Weather: Decodable {
    let city: String
    let temperature: Double
    let icon: String
    let sunrise: Date
    let sunset: Date
}
