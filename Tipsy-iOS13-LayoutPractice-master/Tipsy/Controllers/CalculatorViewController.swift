//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    var tipAmount = 0.10
    var numberOfPeople = 2
    var billPerPerson = 0.0
    var finalResult = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = !sender.isSelected
        let buttonTitle = sender.currentTitle!
        
        let tipAmountWithoutPercent = buttonTitle.dropLast()
        tipAmount = Double(tipAmountWithoutPercent)! / 100
        
        
        print(buttonTitle)
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(numberOfPeople)
       
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let totalBill = Double(billTextField.text!)! // TODO refactor
        
        if billTextField.text! != "" {
            billPerPerson = (totalBill + (totalBill * tipAmount) ) / Double(numberOfPeople)
            let billInTwoDecimal = String(format: "%.2f", billPerPerson)
            finalResult = billInTwoDecimal
            print(finalResult)
        } else {
            print("show Error and disable button")
            
        }
        
        self.performSegue(withIdentifier: "showCalculationResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCalculationResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = finalResult
            destinationVC.tip = Int(tipAmount * 100)
            destinationVC.split = numberOfPeople
        }
    }
}

