//
//  WeatherManager.swift
//  Clima
//
//  Created by Mpilo Pillz on 2023/08/12.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(ProcessInfo.processInfo.environment["API_KEY"] ?? "")&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
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
                    if let weather = parseJSON(weatherData: safeData) {
                        
                    delegate?.didUpdateWeather(weather: weather)
                    }
                }
            }
            
            //4. Start the task
            task.resume() // called resume and not start becuase they start of in a suspended state
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        }
        catch {
            print(error)
            return nil
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
