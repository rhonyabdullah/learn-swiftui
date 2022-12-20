//
//  WeatherServices.swift
//  GoodWeather
//
//  Created by Rhony Abdullah Siagian on 19/12/22.
//

import Foundation

class WeatherService {

    private let baseUrl = "https://api.openweathermap.org/data/2.5/"
    private let apiKey = "0fe2c793cc00659a4e510e413bf16eba"

    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        guard let url = URL(string: "\(baseUrl)/weather?q=\(city)&appId=\(apiKey)&units=imperial") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let response = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let response = response {
                let weather = response.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
