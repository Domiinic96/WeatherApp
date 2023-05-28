//
//  AddCityScreen.swift
//  WeatherAppSwiftUI
//
//  Created by Luis Santana on 27/5/23.
//


import SwiftUI

struct AddCityScreen: View {
    
    @EnvironmentObject var store: Store
    @Environment(\.presentationMode) private var presentationMode
    @State var isSaving = false
    @StateObject private var addWeatherVM = AddWeatherViewModel()
    var body: some View {
        
        VStack {
            VStack(spacing: 20) {
                TextField("Enter city", text: $addWeatherVM.city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button{
                    isSaving = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                        addWeatherVM.save { weather in
                            
                            withAnimation {
                                isSaving.toggle()
                            }
                            
                            if let weather = weather{
                                self.store.addWeather(weather)
                            }
                            
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    })
                   
                   
                } label: {
                    if !isSaving{
                        Text("Save")
                    }else{
                        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
                    }
                    
                }.padding(10)
                    .frame(width: UIScreen.main.bounds.width/2)
                .foregroundColor(Color.white)
                .background(Color(#colorLiteral(red: 0.1297150552, green: 0.3200980425, blue: 0.8191890121, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }.padding()
            .frame(maxWidth: .infinity, maxHeight: 200)
            .background(Color(#colorLiteral(red: 0.913837254, green: 0.9333122373, blue: 0.9802277684, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
         Spacer()
        }.padding()
        
        .navigationTitle("Add City")
        .embedInNavigationView()
    }
}

struct AddCityScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddCityScreen().environmentObject(Store())
    }
}
