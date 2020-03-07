//
//  CurrentWeather.swift
//  jojoNomic
//
//  Created by Reynard Vincent Nata on 06/03/20.
//  Copyright © 2020 ReynardVincent. All rights reserved.
//

import SwiftUI

struct CurrentWeather: View {
    
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
                .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 1))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("\(userLatitude), \(userLongitude)")
                Text(weather)
            }
        }
        
    }
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeather()
    }
}
