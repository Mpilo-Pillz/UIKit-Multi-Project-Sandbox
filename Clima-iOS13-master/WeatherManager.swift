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
        print(ProcessInfo.processInfo.environment["API_KEY"] ?? "")
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
