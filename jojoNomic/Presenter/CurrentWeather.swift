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
    
    let weather = WeatherGetter()
    
    
    var body: some View {
        Text("\(userLatitude), \(userLongitude)")
            .onAppear{
                let theWeather = self.weather.getWeather(lat: self.userLatitude, long: self.userLongitude)
                print(theWeather)
        }
    }
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeather()
    }
}
