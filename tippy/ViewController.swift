//
//  ViewController.swift
//  tippy
//
//  Created by Anoushka Erram on 1/9/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var eachPersonLabel: UILabel!
    
    var total: Double = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billField.becomeFirstResponder()
    }

    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        
        view.endEditing(true)
    }
    
//    @IBAction func tipSliderVal(_ sender: Any) {
//        tipPercentLabel.text = String(format: "Tip: %0.1d%%", Int(tipPercentSlider.value))
//    }
    
    @IBAction func splitSliderVal(_ sender: Any) {
        splitLabel.text = "Split: \(Int(splitSlider.value))"
        calculateTip(eachPersonLabel)

    }
//    func updateUI(){
//        let splitAmt: Int = splitSlider.value as! Int
//    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //Get bill amount
            //let or var = variable; let is used when variable will be constant
            //?? changes everything to the left of the question mark to 0 if not valid
        let bill = Double(billField.text!) ?? 0
        
        //Calculate tip and total
        let tipPercentages = [0, 0.1,0.15, 0.18, 0.2]
        
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = tip + bill
        
        //Update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        print(total)
        updateUI()
        
//        let splitAmt: Int = Int(splitSlider.value)
//        eachPersonLabel.text = String(format: "$%0.2f", total/Double(splitAmt))
        
        //print (splitAmt)
    }
    
    func updateUI(){
        let splitAmt: Int = Int(splitSlider.value)
        eachPersonLabel.text = String(format: "$%0.2f", total/Double(splitAmt))
        print(splitAmt)
    }
}

