//
//  AddWeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Rhony Abdullah Siagian on 30/12/22.
//

import Foundation
import OSLog

class AddWeatherViewModel: ObservableObject {

    private let service: Webservice

    init() {
        service = Webservice()
    }

    var city: String = ""

    func save(completion: @escaping (WeatherViewModel) -> Void) {
    
        service.getWeatherByCity(city: city) { (result) in

            switch result {
            case .success(let weather): DispatchQueue.main.async {
                completion(WeatherViewModel(weather: weather))
                }
            case .failure(let error): Logger().error("\(error)")
            }

        }
    }

}
