//
//  Weather.swift
//  jojoNomic
//
//  Created by Reynard Vincent Nata on 06/03/20.
//  Copyright © 2020 ReynardVincent. All rights reserved.
//

import Foundation
import Combine

class WeatherGetter:ObservableObject {
    private let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "e63da0d1b1b37b45d94c56f8a92633cb"
    //api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={your api key}
    
    func getWeather(lat: Double, long: Double) -> String {
        var todayWeather = "Today's Weather"
        if let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?lat=\(lat)&lon=\(long)&appid=\(openWeatherMapAPIKey)"){
            todayWeather = getData(weather: weatherRequestURL)
        }
        return todayWeather
    }
    
    func searchedCity(city: String) -> String {
        var cityWeather = "City's Weather"
        if let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?q=\(city)&appid=\(openWeatherMapAPIKey)"){
           cityWeather = getData(weather: weatherRequestURL)
        }
        return cityWeather
    }
    
    func getData(weather: URL) -> String{
        var weatherDescription = "Weather Description"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: weather){
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                // Case 1: Error
                print("Error:\n\(error)")
            }
            else {
                // Case 2: Success
                if let urlContent = data{
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
                            
                        if let weatherData = (jsonResult["weather"] as? Array<[String: Any]>){
                            weatherDescription = weatherData[0]["description"] as! String
                        }
                    } catch {
                        print("JSON Processing failed")
                    }
                } else {
                    print("Error during JSON parsing")
                }
            }
        }
        dataTask.resume()
        return weatherDescription
    }
}
