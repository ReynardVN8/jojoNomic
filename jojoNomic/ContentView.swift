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
