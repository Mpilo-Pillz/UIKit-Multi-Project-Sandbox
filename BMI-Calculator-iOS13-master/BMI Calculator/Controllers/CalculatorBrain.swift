//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Mpilo Pillz on 2023/10/14.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
//    var bmiValue = "0.0"
    var bmi: BMI?
    
//   mutating func calculateBMIMisolution(height: Float, weight: Float){
//        let bmi = weight / pow(height, 2)
//        bmiValue = String(format: "%.1f", bmi)
//    }
//
//    func getBMIValueMysolution() -> String {
//        return self.bmiValue
//    }
    
    func getBMIValue() -> String {
        let bmiToDecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToDecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advise ?? "No BMI information" // wont hit this but best to catch it ncase of a refactor and we forget
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.systemBackground
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            print("Underweight")
            bmi = BMI(value: bmiValue, advise: "Eat more snacks", color: UIColor.systemBlue)
        } else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advise: "You are perfectly fit", color: UIColor.systemGreen)
            print("Normal weight")
        } else {
            bmi = BMI(value: bmiValue, advise: "Eat less snacks", color: UIColor.systemRed)
            print("Overweight")
        }

    }
    
}
