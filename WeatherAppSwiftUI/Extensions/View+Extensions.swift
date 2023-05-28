//
//  View+Extensions.swift
//  WeatherAppSwiftUI
//
//  Created by Luis Santana on 27/5/23.
//


import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        return NavigationView { self }
    }
    
}
