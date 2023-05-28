//
//  Constants.swift
//  WeatherAppSwiftUI
//
//  Created by Luis Santana on 27/5/23.
//


import Foundation

struct Constants {
    struct Urls {
        static func weatherByCity(city: String) -> URL? {
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=1bd06d2a44beeef33a4289bbaee8db9e")
        }
        
        static func weatherUrlAsStringByIcon(icon: String) -> String {
            return "https://openweathermap.org/img/w/\(icon).png"
        }
    }
}
