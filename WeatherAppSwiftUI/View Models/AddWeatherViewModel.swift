//
//  AddWeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Luis Santana on 27/5/23.
//

import Foundation


class AddWeatherViewModel: ObservableObject {
    
    
    var city = ""
    func save(completion: @escaping (WeatherViewModel?) ->  Void) {
        
        Webservice().getWeatherByCity(city: city) { (result) in
            
            switch result{
                
            case .success(let weather):
                DispatchQueue.main.async {
                    completion(WeatherViewModel(weather: weather))
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
                
            }
        }
    }
}
