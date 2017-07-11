//
//  ViewController.swift
//  TipCalculatorJuly
//
//  Created by Hsiu-Wei Chang on 03/07/2017.
//  Copyright © 2017 Hsiu-Wei Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
  
    
    
    @IBOutlet weak var tipSelector: UISegmentedControl!
        
    
    @IBAction func tipSelectorTapped(_ sender: Any) {
        if let bill = Double(billAmountField.text!) {
            
            var tipPercent = 0.0
            
            switch tipSelector.selectedSegmentIndex {
            case 0:
                tipPercent = 0.1
            case 1:
                tipPercent = 0.15
            case 2:
                tipPercent = 0.18
            case 3:
                tipPercent = 0.20
            default:
                break
            }
            
            let tipAmount = round(bill*tipPercent*100)/100
            let totalAmount = round(bill*(1+tipPercent)*100)/100
            
            tipAmountField.text = String(format: "%.2f", tipAmount)
            totalAmountField.text = String(format: "%.2f", totalAmount)
            
            
        } else {
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
        }

    }
    
    @IBOutlet weak var billAmountField: UITextField!
    
    
    
    @IBOutlet weak var tipAmountField: UITextField!
    
    @IBOutlet weak var totalAmountField: UITextField!
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        billAmountField.text = ""
        tipAmountField.text = ""
        totalAmountField.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        billAmountField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldDidChange(textField:UITextField){
        print("typed something")
        if let bill = Double(billAmountField.text!) {
            
            var tipPercent = 0.0
            
            switch tipSelector.selectedSegmentIndex {
            case 0:
                tipPercent = 0.1
            case 1:
                tipPercent = 0.15
            case 2:
                tipPercent = 0.18
            case 3:
                tipPercent = 0.20
            default:
                break
            }
            
            let tipAmount = round(bill*tipPercent*100)/100
            let totalAmount = round(bill*(1+tipPercent)*100)/100
            
            tipAmountField.text = String(format: "%.2f", tipAmount)
            totalAmountField.text = String(format: "%.2f", totalAmount)
            
            
        } else {
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
        }

    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

