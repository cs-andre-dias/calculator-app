//
//  ViewController.swift
//  Calculator
//
//  Created by Andre Dias on 9/15/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(sender: UIButton) {
        let titleButton = sender.currentTitle!
        if sender == dotButton && (display.text?.containsString("."))! {
            return
        }
        if userIsInTheMiddleOfTyping {
            let textInDisplay = display.text!
            display.text = textInDisplay + titleButton
        }else{
            display.text = titleButton
        }
        
        userIsInTheMiddleOfTyping = true
    }
  
    private var displayValue: Double{
        get {
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    private var calcBrain = CalculatorBrain()

    @IBAction private func performOperation(sender: UIButton) {
        
        if userIsInTheMiddleOfTyping {
            calcBrain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathSymbol = sender.currentTitle {
            calcBrain.performOperation(mathSymbol)
        }
        
        displayValue = calcBrain.result
        
        
    }
}

