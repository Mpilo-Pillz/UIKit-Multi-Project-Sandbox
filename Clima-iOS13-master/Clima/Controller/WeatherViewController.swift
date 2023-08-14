//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit


class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.delegate = self // this is sooo forgettable
        searchTextField.delegate = self // super forgettable
    }

    
    
//    func didUpdateWeather(weather: WeatherModel) {
//        print("Did update weateher\(weather)")
//    }
    
//    func didUpdateWeather(weatherManager: WeatherManager, weather: WeatherModel) {
//        print("Did update weateher\(weather)")
//    }
    
    
    
    
}
//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true) // we are manually putting the textfield on end editing mode
        print(searchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true) // end etiting and dismiss the keyboard
        print(searchTextField.text!)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // normally used to perform some validation
        if textField.text != "" {
            return true // let the end editing
        } else {
            textField.placeholder = "Type something"
            return false // keep user in editing mode
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = "" // saves us doing it twice after line 26 or after line 31
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    // Following Apples naming convention
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
//        temperatureLabel.text = weather.temperatureString // UILabel.text must be used from main thread only
//        print("Did update weateher\(weather)")
        
//        DispatchQueue.main.async { [self] in
//            temperatureLabel.text = weather.temperatureString
//            conditionImageView.image = UIImage(systemName: weather.conditionName)
//        }

        
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}




// What it was like before refatroing to use extensions
//import UIKit
//
//
//class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
//
//    @IBOutlet weak var conditionImageView: UIImageView!
//    @IBOutlet weak var temperatureLabel: UILabel!
//    @IBOutlet weak var cityLabel: UILabel!
//    @IBOutlet weak var searchTextField: UITextField!
//
//    var weatherManager = WeatherManager()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        weatherManager.delegate = self // this is sooo forgettable
//        searchTextField.delegate = self // super forgettable
//    }
//
//    @IBAction func searchPressed(_ sender: UIButton) {
//        searchTextField.endEditing(true) // we are manually putting the textfield on end editing mode
//        print(searchTextField.text!)
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        searchTextField.endEditing(true) // end etiting and dismiss the keyboard
//        print(searchTextField.text!)
//        return true
//    }
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        // normally used to perform some validation
//        if textField.text != "" {
//            return true // let the end editing
//        } else {
//            textField.placeholder = "Type something"
//            return false // keep user in editing mode
//        }
//
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if let city = searchTextField.text {
//            weatherManager.fetchWeather(cityName: city)
//        }
//        searchTextField.text = "" // saves us doing it twice after line 26 or after line 31
//    }
//
////    func didUpdateWeather(weather: WeatherModel) {
////        print("Did update weateher\(weather)")
////    }
//
////    func didUpdateWeather(weatherManager: WeatherManager, weather: WeatherModel) {
////        print("Did update weateher\(weather)")
////    }
//
//    // Following Apples naming convention
//    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
////        temperatureLabel.text = weather.temperatureString // UILabel.text must be used from main thread only
////        print("Did update weateher\(weather)")
//
////        DispatchQueue.main.async { [self] in
////            temperatureLabel.text = weather.temperatureString
////            conditionImageView.image = UIImage(systemName: weather.conditionName)
////        }
//
//
//        DispatchQueue.main.async {
//            self.temperatureLabel.text = weather.temperatureString
//            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
//        }
//    }
//
//    func didFailWithError(error: Error) {
//        print(error)
//    }
//
//
//}
