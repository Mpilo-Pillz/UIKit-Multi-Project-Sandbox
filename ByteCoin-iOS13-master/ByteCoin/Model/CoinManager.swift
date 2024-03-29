//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    // Wated alot of my time becuase it wanted me to pass the delegate as an argument to the constructor
//    let delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    
    func getCoinPrice(for currency: String) {
        print("curren \(currency)")
        let urlString = "\(baseURL)/\(currency)?apiKey=\(ProcessInfo.processInfo.environment["API_KEY"] ?? apiKey)"
        
        performRequest(with: urlString)
        
        
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error ?? "Failed To Fetch")
                    return
                }
                
                if let safeData = data {
                    if let coin = parseJSON(safeData) {
                        print(coin)
                        delegate?.didUpdatePrice(self, coin: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let time = decodedData.time
            let asset_id_base = decodedData.asset_id_base
            let rate = decodedData.rate
            let asset_id_quote = decodedData.asset_id_quote
            
            let coin = CoinModel(time: time, assetIdBase: asset_id_base, assetIdQuote: asset_id_quote, rate: rate)
            return coin
        } catch {
            print(error)
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
