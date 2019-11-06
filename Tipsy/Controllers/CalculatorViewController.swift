//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var numOfPeople = 2
    var tip = 0.10
    var billTotal = 0.0
    var finalResult = "0.0"

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var fifteenPctButton: UIButton!
    @IBOutlet weak var eighteenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        fifteenPctButton.isSelected = false
        eighteenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        if sender.tag == 1 {
            tip = 0.15
        } else if sender.tag == 2 {
            tip = 0.18
        } else {
            tip = 0.20
        }
      
    
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    
        splitNumberLabel.text = Int(sender.value).description
        numOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        print(tip)
        
        let billText : String = billTextField.text ?? ""
        
        billTotal = billText.toDouble() ?? 0.0
        
        // bill * tipamount + billamount / split
        

        
        let result = ((billTotal * tip) + billTotal) / Double(numOfPeople)
        finalResult = String(format: "%.2f", result)
        
        print(finalResult)
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    //This method gets triggered just before the segue starts.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //If the currently triggered segue is the "goToResults" segue.
        if segue.identifier == "goToResult" {
            
            //Get hold of the instance of the destination VC and type cast it to a ResultViewController.
            let destinationVC = segue.destination as! ResultsViewController
            
            //Set the destination ResultsViewController's properties.
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numOfPeople
            
        }
    }

    
    
    
    
    
}

extension String {
func toDouble() -> Double? {
    return NumberFormatter().number(from:)(self)?.doubleValue
 }
}

