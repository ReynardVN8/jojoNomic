//
//  CurrentWeather.swift
//  jojoNomic
//
//  Created by Reynard Vincent Nata on 06/03/20.
//  Copyright © 2020 ReynardVincent. All rights reserved.
//

import SwiftUI
import CoreData

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
    }
    
    
    var body: some View {
        HStack {
            VStack{
                Text("\(userLatitude), \(userLongitude)")
                Text(weather)
            }
            Button(action: {
                
            }) {
                Text("Save")
            }
        }.padding()
        
    }
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeather()
    }
}
