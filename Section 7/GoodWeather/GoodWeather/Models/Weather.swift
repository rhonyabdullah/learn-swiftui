//
//  Weather.swift
//  GoodWeather
//
//  Created by Rhony Abdullah Siagian on 19/12/22.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
