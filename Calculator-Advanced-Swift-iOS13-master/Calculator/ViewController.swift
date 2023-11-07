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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        // no need to make private it is locally scoped
//        let number = Double(displayLabel.text!)! // using if let is not always the best thing, sometimes you need it to crash
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display lable text to double")
        }
        
        // optional binding
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1) // convert to negative
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayLabel.text = String(number * 0.01)
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
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    
    }

}

