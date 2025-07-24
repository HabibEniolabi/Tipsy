//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var tenPercentTipLabel: UIButton!
    @IBOutlet weak var enterBillLabel: UITextField!
    @IBOutlet weak var zeroPercentTipLabel: UIButton!
    @IBOutlet weak var twentyPercentTipLabel: UIButton!
    @IBOutlet weak var splitBillLabel: UILabel!
    
    var selectedTip: Double = 0.10
    var totalBill: Double = 0.0
    var numberOfPpl: Int = 2
    var finalAmount:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        enterBillLabel.text = ""
        enterBillLabel.placeholder = "e.g 12.53"
        enterBillLabel.keyboardType = .decimalPad
    }


    @IBAction func calculatePressed(_ sender: UIButton) {
        let billText = enterBillLabel.text ?? ""
        if billText != "",
           let bill = Double(billText) {
            let totalBill = bill * (1 + selectedTip)
            let individualBill = totalBill / Double(numberOfPpl)
            finalAmount = String(format: "%.2f", individualBill)
            performSegue(withIdentifier: "goToResult", sender: self)
        }else{
            print("Invalid amount inputed")
        }
    }
    @IBAction func tipButton(_ sender: UIButton) {
        zeroPercentTipLabel.isSelected = false
        tenPercentTipLabel.isSelected = false
        twentyPercentTipLabel.isSelected = false
        
        sender.isSelected = true
        
        switch sender{
            case zeroPercentTipLabel:
                selectedTip = 0.0
            case tenPercentTipLabel:
                selectedTip = 0.10
            case twentyPercentTipLabel:
                selectedTip = 0.20
            default:
                selectedTip = 0.0
            }
        
    }
    @IBAction func addSubPressed(_ sender: UIStepper) {
        splitBillLabel.text = String(format: "%.0f", sender.value)
        numberOfPpl = Int(sender.value)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalAmount = finalAmount
            destinationVC.tip = selectedTip
            destinationVC.split = numberOfPpl
        }
    }
}
