//
//  WeatherService.swift
//  OpenWeatherApp
//
//  Created by Rhony on 18/12/20.
//

import Foundation

class WeatherService {
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        
        let appId = "0fe2c793cc00659a4e510e413bf16eba"
        let celcius = "metric"
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(appId)&units=\(celcius)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
            
        }.resume()
        
    }
    
    
}
