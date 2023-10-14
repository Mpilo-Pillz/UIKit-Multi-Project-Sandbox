//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var bmiValue = "0.0"
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        print("height\(String(format: "%.2f", sender.value ))")
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        print("Weight \(Int(sender.value))")
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        let bmi = weight / pow(height, 2)
        bmiValue = String(format: "%.1f", bmi)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
//        goToProgramaticViewController(bmi: bmi)
        
        print(bmi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC =  segue.destination as! ResultsViewController
            destinationVC.bmiValue = bmiValue
        }
    }
    
    func goToProgramaticViewController(bmi: Float) {
        let secondViewController = SecondViewController()
        secondViewController.bmiValue = String(format: "%.1f", bmi)
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    
}

