//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Habibullah Ayomide on 7/23/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalAmount: String?
    var tip: Double? = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        totalLabel.text = totalAmount
//        settingsLabel.text = "Split between \(split) people, with \(String(describing: tip))% tip."
        
        if let tip = tip,
               let total = totalAmount {
                totalLabel.text = total
                settingsLabel.text = "Split between \(split) people, with \(Int(tip * 100))% tip."
            } else {
                totalLabel.text = "Error"
                settingsLabel.text = "Something went wrong"
            }
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
        
