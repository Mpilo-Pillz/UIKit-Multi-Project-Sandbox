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
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    var tipAmount = 0.10
    var numberOfPeople = 2
    var billPerPerson = 0.0
    var finalResult = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.isEnabled = false
        billTextField.delegate = self
        
        calculateButton.setBackgroundColor(.systemGray, for: .disabled)
        calculateButton.setBackgroundColor(.systemGreen, for: .normal)
//        calculateButton.setTitleColor(.systemGreen, for: .normal)
//        calculateButton.setTitleColor(.systemGray, for: .disabled)
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
     
            billPerPerson = (totalBill + (totalBill * tipAmount) ) / Double(numberOfPeople)
            let billInTwoDecimal = String(format: "%.2f", billPerPerson)
            finalResult = billInTwoDecimal
            print(finalResult)
        
        
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

extension CalculatorViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        calculateButton.isEnabled = !newText.isEmpty && Double(newText)! > 0
        return true
    }
    

}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            setBackgroundImage(colorImage, for: state)
        }
    }
}


