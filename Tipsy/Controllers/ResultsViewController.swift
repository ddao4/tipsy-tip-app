//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Dustin Dao on 10/25/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var result = "0.00"
    var tip = 15
    var split = 2
    
    let calculatorVC = CalculatorViewController()

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "$\(result)"
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
        
        // Do any additional setup after loading the view.
    }
    
        @IBAction func recalculatePressed(_ sender: UIButton) {
            self.dismiss(animated: true, completion: nil)
            
    }
    
}
