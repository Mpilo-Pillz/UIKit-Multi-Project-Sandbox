//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
// private - only acceiible on the class or block of code - app creation // make them private by default for best practice
// fileprivate - accessible inside the file - app creation
// internal - accessible anywhee in the app module. - app creation
// public - access is granted to other modules - framework creation
// open - plublic plus any file can do as they please to it - framework creation

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display lable text to double")
            }
            return number
        }
        set {
           // set when ever the display value is updated
            // we have to update display label to triggert his code
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        // no need to make private it is locally scoped
//        let number = Double(displayLabel.text!)! // using if let is not always the best thing, sometimes you need it to crash
        
//        guard let number = Double(displayLabel.text!) else {
//            fatalError("Cannot convert display lable text to double")
//        }
        
        // optional binding
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
//                displayLabel.text = String(displayValue * -1) // convert to negative
                displayValue *=  -1 // convert to negative
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
//                displayLabel.text = String(displayValue * 0.01)
                displayValue *= 0.01
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                /**
                 * if there is a decimal place
                 * return
                 * eg if 5.3 rounded down is 5
                 * if 5 is equal to 5 on the current display then this is an int add a decimal
                 * else if it 5 is equal to 5.3 form the current display this it not an int then retrun
                 */
                if numValue == "." {
//                    guard let currentDisplayValue = Double(displayLabel.text!) else {
//                        fatalError("Cannot convert display label text to a double")
//                    }
//                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    let isInt = floor(displayValue) == displayValue
                    print("curr--> \(displayValue)")
                    print("floor--> \(floor(displayValue))")
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    
    }

}

