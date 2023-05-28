//
//  Store.swift
//  WeatherAppSwiftUI
//
//  Created by Luis Santana on 27/5/23.
//

import Foundation


class Store: ObservableObject{
    
    
    @Published var selectedUnit: TemperatureUnit = .kelvin
    @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
    
    
    
    init() {
        selectedUnit = UserDefaults.standard.unit
    }
    
    func addWeather(_ newWeather: WeatherViewModel){
        
        self.weatherList.append(newWeather)
    }
    
    
}
