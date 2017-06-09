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
    
    var isInput: Bool = false;
    
    var myOperator: String = ""
    
    var firstNumber: Int32 = 0
    
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if isInput {
            display.text = display.text! + digit
        } else {
            display.text = digit
            isInput = true
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        display.text = "0"
        isInput = false
    }
    
    @IBAction func setOperator(_ sender: UIButton) {
        myOperator = sender.currentTitle!
        firstNumber = Int32(display.text!)!
    }
    
    @IBAction func calculation(_ sender: UIButton) {
//        let secondNumber = Int32(display.text!)!
//        display.text = String(firstNumber + secondNumber)!
    }
    
    
}

