//
//  Weather.swift
//  WeatherAppSwiftUI
//
//  Created by Luis Santana on 27/5/23.
//


import Foundation

struct WeatherResponse: Decodable {
    let name:String
    var weather: Weather
    let icon: [WeatherIcon]
    let sys: Sys
    private enum CodingKeys: String, CodingKey{
        case name
        case weather = "main"
        case icon = "weather"
        case sys = "sys"
    }
    
    enum WeatherCodingKeys:String, CodingKey{
        
        case temperature = "temp"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.icon = try container.decode([WeatherIcon].self, forKey: .icon)
        self.name = try container.decode(String.self, forKey: .name)
        self.sys = try container.decode(Sys.self, forKey: .sys)
//        self.weather = try container.decode(Weather.self, forKey: .weather)
        
        let weatherContainer = try container.nestedContainer(keyedBy: WeatherCodingKeys.self, forKey: .weather)
        
        let temperature = try weatherContainer.decode(Double.self, forKey: .temperature)
        
        self.weather = Weather(city: name, temperature: temperature, icon: icon.first!.icon, sunrise: sys.sunsire, sunset: sys.sunset)
    }
}

struct Weather: Decodable {
    let city: String
    let temperature: Double
    let icon:String
    let sunrise:Date
    let sunset:Date
}


struct WeatherIcon: Decodable {
    let main:String
    let description:String
    let icon:String
}

struct Sys: Decodable{
    
    
    let sunsire: Date
    let sunset: Date
    
    private enum CodingKeys: String, CodingKey{
        
       case sunrise = "sunrise"
       case sunset = "sunset"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let sunriseTimeInterval  = try container.decode(Int32.self, forKey: .sunrise)
        let sunsetTimeInterval = try container.decode(Int32.self, forKey: .sunset)
        
        
        sunsire = Date(timeIntervalSince1970: TimeInterval(sunriseTimeInterval))
        sunset = Date(timeIntervalSince1970: TimeInterval(sunsetTimeInterval))
        
//        self.sunsire = try container.decode(Data.self, forKey: .sunsire)
//        self.sunset = try container.decode(Date.self, forKey: .sunset)
    }
}
