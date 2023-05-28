//
//  WeatherAppSwiftUIApp.swift
//  WeatherAppSwiftUI
//
//  Created by Luis Santana on 27/5/23.
//


import SwiftUI

@main
struct WeatherAppSwiftUIApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            WeatherListScreen().environmentObject(Store())
        }
    }
}
