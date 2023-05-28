//
//  WeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Luis Santana on 27/5/23.
//

import Foundation

struct WeatherViewModel {
    let weather: Weather
    
    func getTemperatureByUnit(unit: TemperatureUnit) -> Double{
        
        
        switch unit{
        case .kelvin:
            return weather.temperature
        case .celsius:
            return weather.temperature - 273.15
        case .fahrenheit:
            return 1.8 * (weather.temperature - 273.15) + 32
        }
    }
    
    var temperature:Double{
        return weather.temperature
    }
    var city:String{
        return weather.city
    }
    var icon:String{
        return weather.icon
    }
    var sunrise:Date{
        return weather.sunrise
    }
    var sunset:Date{
        return weather.sunset
    }
    
    
}
