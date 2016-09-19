//
//  ViewController.swift
//  Calculator
//
//  Created by Andre Dias on 9/15/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(sender: UIButton) {
        let titleButton = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textInDisplay = display.text!
            display.text = textInDisplay + titleButton
        }else{
            display.text = titleButton
        }
        
        userIsInTheMiddleOfTyping = true
    }
    
    var displayValue: Double{
        get {
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }

    @IBAction func performOperation(sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let piSymbol = sender.currentTitle {
            if piSymbol == "π"{
                displayValue = M_PI
            }
        }
    }
}

