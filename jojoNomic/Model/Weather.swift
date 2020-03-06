//
//  Weather.swift
//  jojoNomic
//
//  Created by Reynard Vincent Nata on 06/03/20.
//  Copyright © 2020 ReynardVincent. All rights reserved.
//

import Foundation

class WeatherGetter {
    private let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "e63da0d1b1b37b45d94c56f8a92633cb"
    //api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={your api key}
    
    let session = URLSession.shared
    
    func getWeather(lat: Double, long: Double) {
        let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?lat=\(lat)&lon=\(long)&appid=\(openWeatherMapAPIKey)")!
      
      // The data task retrieves the data.
        let dataTask = session.dataTask(with: weatherRequestURL){
        (data: Data?, response: URLResponse?, error: Error?) in
        if let error = error {
          // Case 1: Error
          print("Error:\n\(error)")
        }
        else {
          // Case 2: Success
          print("Data:\n\(data!)")
        }
      }
      dataTask.resume()
    }
    
    func searchWeatherLocation(city: String){
        let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?appid=\(openWeatherMapAPIKey)&q=\(city)")!
        
        // The data task retrieves the data.
        let dataTask = session.dataTask(with: weatherRequestURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
                if let error = error {
                    // Case 1: Error
                    print("Error:\n\(error)")
                }
                else {
                    // Case 2: Success
                    print("Data:\n\(data!)")
                }
            }
        dataTask.resume()
    }
}
