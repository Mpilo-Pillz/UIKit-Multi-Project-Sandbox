//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Mpilo Pillz on 2023/10/14.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        let label = UILabel()
        label.text = bmiValue
        label.frame = CGRect(x: 50, y: 0, width: 100, height: 50)
        view.addSubview(label)
    }
}
