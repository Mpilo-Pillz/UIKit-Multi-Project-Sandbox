//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController   {
   
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        currencyPicker.dataSource = self // tell the picker that this calss is capable of providing data to it also tell it that this calss is the datasource
        currencyPicker.delegate = self // detect if picker has been interacted with
        // Do any additional setup after loading the view.
    }
}

// MARK: - CoinMAnagerDelegate
extension ViewController: CoinManagerDelegate {
    func didUpdatePrice(_ coinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async { [self] in
            bitcoinLabel.text = String(format: "%.2f", coin.rate)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

// MARK: - CoinMAnagerDelegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        currencyLabel.text = selectedCurrency
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}

