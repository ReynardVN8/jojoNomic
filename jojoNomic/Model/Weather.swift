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
    func getWeather(lat: Double, long: Double) {
      // This is a pretty simple networking task, so the shared session will do.
        let session = URLSession.shared
        let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?lat=\(lat)&lon=\(long)&appid=\(openWeatherMapAPIKey)")!
      
      // The data task retrieves the data.
        let dataTask = session.dataTask(with: weatherRequestURL){
        (data: Data?, response: URLResponse?, error: Error?) in
        if let error = error {
          // Case 1: Error
          // We got some kind of error while trying to get data from the server.
          print("Error:\n\(error)")
        }
        else {
          // Case 2: Success
          // We got a response from the server!
          print("Data:\n\(data!)")
        }
      }
      
      // The data task is set up...launch it!
      dataTask.resume()
    }
}
