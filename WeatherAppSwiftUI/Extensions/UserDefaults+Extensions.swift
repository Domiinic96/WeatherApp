//
//  UserDefaults+Extensions.swift
//  WeatherAppSwiftUI
//
//  Created by Luis Santana on 27/5/23.
//


import Foundation

extension UserDefaults {
    
    var unit: TemperatureUnit {
        guard let value = self.value(forKey: "unit") as? String else {
            return .kelvin
        }
        return TemperatureUnit(rawValue: value) ?? .kelvin
    }
    
}
