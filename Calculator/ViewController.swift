//
//  ViewController.swift
//  Calculator
//
//  Created by 王云飞 on 2017/6/3.
//  Copyright © 2017年 王云飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var isInput = false
    
    
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if isInput {
            display.text = display.text! + digit
        } else {
            display.text = digit
            isInput = true
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        operandStack.append(displayValue)
        isInput = false
        print("operandStack = \(operandStack)")
    }
    
    var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = "\(newValue)"
            isInput = false
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        display.text = "0"
        operandStack.removeAll()
        isInput = false
    }
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if isInput {
            enter()
        }
        switch operation {
        case "×" : performOperation() { $0 * $1 }
        case "÷" : performOperation() { $1 / $0 }
        case "+" : performOperation() { $0 + $1 }
        case "-" : performOperation() { $1 - $0 }
            
        default:
            break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    
    
    
    
    
}

