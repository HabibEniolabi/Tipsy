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
    
    var totalAmount = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
    }
    
}
        
