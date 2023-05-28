//
//  WeatherListScreen.swift
//  WeatherAppSwiftUI
//
//  Created by Luis Santana on 27/5/23.
//


import SwiftUI


enum Sheets:Identifiable{
    
    var id: UUID {
        return UUID()
    }
    
    case addNewCity
    case settings
}

struct WeatherListScreen: View {
    @EnvironmentObject var store: Store
    @State var activeShet: Sheets?
    
        
    var body: some View {
        
        
        VStack{
            WeatherCell(weather: store.weatherList, selectedUnit: store.selectedUnit)
        }
        .sheet(item: $activeShet, content: { (item) in
            
            if item == .addNewCity{
                AddCityScreen().environmentObject(store)
            }else{
                SettingsScreen().environmentObject(store)
            }
            
            
        })
        
        .navigationBarItems(leading: Button(action: {
            activeShet = .settings
        }) {
            Image(systemName: "gearshape")
        }, trailing: Button(action: {
            activeShet = .addNewCity
        }, label: {
            Image(systemName: "plus")
        }))
        .navigationTitle("Cities")
        .embedInNavigationView()
       
    }
}

struct WeatherListScreen_Previews: PreviewProvider {
    static var previews: some View {
        return WeatherListScreen().environmentObject(Store())
    }
}

struct WeatherCell: View {
    
    let weather: [WeatherViewModel]
    let selectedUnit: TemperatureUnit
    var body: some View {
        
        
        
        List {
            ForEach(weather, id: \.city) { wt in
                HStack {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(wt.city)
                            .fontWeight(.bold)
                        HStack {
                            Image(systemName: "sunrise")
                            Text("\(wt.sunrise.formatAsString())")
                        }
                        HStack {
                            Image(systemName: "sunset")
                            Text("\(wt.sunset.formatAsString())")
                        }
                    }
                    Spacer()
                    
                    URLImage(url: Constants.Urls.weatherUrlAsStringByIcon(icon: wt.icon))
                        .frame(width: 50, height: 50)
                    
                    Text(String.get2FloatPoints(value: wt.getTemperatureByUnit(unit: selectedUnit)).appending(" ").appending(selectedUnit.displayText.prefix(1)))
                }
                .padding()
                .background(Color(#colorLiteral(red: 0.9133135676, green: 0.9335765243, blue: 0.98070997, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            }
        }
        .listStyle(PlainListStyle())

    }
}
