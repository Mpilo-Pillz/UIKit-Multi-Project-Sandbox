//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Mpilo Pillz on 2023/11/09.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import UIKit
// structs are first calss citizens
struct CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        if symbol == "+/-" {
            return number *  -1 // convert to negative
        } else if symbol == "AC" {
            return 0
        } else if symbol == "%" {
            return number * 0.01
        }
        return nil
    }
}
