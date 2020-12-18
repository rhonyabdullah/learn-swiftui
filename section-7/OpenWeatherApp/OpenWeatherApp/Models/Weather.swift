//
//  Weather.swift
//  OpenWeatherApp
//
//  Created by Rhony on 18/12/20.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
