//
//  ViewController.swift
//  Calculator2.0
//
//  Created by Egor on 04.06.2024.
//

import UIKit

class ViewController: UIViewController {

    private var isFinishTyping: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else { fatalError("Can't convert number")}
            return number
        }
        set {
            return displayLabel.text = String(newValue)
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calc = CalcLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishTyping = true
        
        calc.setNumber(displayValue)
        
        if let calcNumberber = sender.titleLabel?.text {
            
            if let result = calc.calculation(symbol: calcNumberber) {
                displayValue = result
            }
            
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {

        if let number = sender.titleLabel?.text {
            if isFinishTyping {
                displayLabel.text = number
                isFinishTyping = false
            } else {
                if number == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text! += number
            }
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

