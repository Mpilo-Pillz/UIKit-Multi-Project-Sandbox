//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Mpilo Pillz on 2023/10/14.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var bmiValue = "0.0"
    var bmi: Float? = nil
    
   mutating func calculateBMIMisolution(height: Float, weight: Float){
        let bmi = weight / pow(height, 2)
        bmiValue = String(format: "%.1f", bmi)
    }
    
    func getBMIValueMysolution() -> String {
        return self.bmiValue
    }
    
    func getBMIValue() -> String {
        let bmiToDecimalPlace = String(format: "%.1f", bmi!)
        return bmiToDecimalPlace
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        bmi = weight / (height * height)
    }
    
}
