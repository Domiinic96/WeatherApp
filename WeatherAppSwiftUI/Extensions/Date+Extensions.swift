//
//  Date+Extensions.swift
//  WeatherAppSwiftUI
//
//  Created by Luis Santana on 27/5/23.
//


import Foundation


extension Date {
    
    func formatAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: self)
    }
    
}
