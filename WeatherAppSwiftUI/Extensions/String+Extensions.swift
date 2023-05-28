//
//  String+Extensions.swift
//  WeatherAppSwiftUI
//
//  Created by Luis Santana on 27/5/23.
//


import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self 
    }
    
    
    static func get2FloatPoints(value: Double) -> String{
        
        return Self.init(format: "%.2f", value)
    }
    
    
    
}
