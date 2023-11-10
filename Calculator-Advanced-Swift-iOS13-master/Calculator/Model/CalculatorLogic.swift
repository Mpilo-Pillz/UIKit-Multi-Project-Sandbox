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
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
//     dont need an init for stuct we get a free one
//    init(number: Double) {
//        self.number = number
//    }
    
    mutating func calculate(symbol: String) -> Double? {
        // unwrappedN
        // can aslo use a switch case
        if let n = number {
            switch symbol  {
            case "+/-":
                return n *  -1 // convert to negative
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTowNumberCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
            
            
        }
        return nil
    }
    
    private func performTowNumberCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
          
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
                
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
       
            
        }
        
        return nil
    }
}
