//
//  WeatherManager.swift
//  Clima
//
//  Created by Mpilo Pillz on 2023/08/12.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let apiKey = "45cf5616338089a72bccc089890e71fe"
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(ProcessInfo.processInfo.environment["API_KEY"] ?? "")&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. Create URL
        if let url = URL(string: urlString) {
            //2. Create a URL Session
            let session = URLSession(configuration: .default)
            
            //3. Give th session a task
            //            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!) // can force unwrap because we already checked if it is not nil
                    return
                }
                
                if let safeData = data {
                    parseJSON(weatherData: safeData)
                    
                }
            }
            
            //4. Start the task
            task.resume() // called resume and not start becuase they start of in a suspended state
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
        }
        catch {
            print(error)
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void {
        //        keeping for reference
        if error != nil {
            print(error!) // can force unwrap because we already checked if it is not nil
            return
        }
        
        if let safeData = data {
            // tough to print responses we have to first convert to a string
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString ?? "")
        }
    }
}
