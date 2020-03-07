//
//  ContentView.swift
//  jojoNomic
//
//  Created by Reynard Vincent Nata on 06/03/20.
//  Copyright © 2020 ReynardVincent. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager()

        var userLatitude: Double {
            return locationManager.lastLocation?.coordinate.latitude ?? 0
        }

        var userLongitude: Double {
            return locationManager.lastLocation?.coordinate.longitude ?? 0
        }
        
        var weather: String {
            return WeatherGetter().getWeather(lat: userLatitude, long: userLongitude)
    //        return WeatherGetter().searchedCity(city: "Jakarta")
        }
        
        
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 0.6, green: 1, blue: 0.95, opacity: 1))
                    .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("Your Location coordinate: latitude, longitude").padding()
                        Text("\(userLatitude), \(userLongitude)").padding()
                        Text(weather).padding()
                }.padding()
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
