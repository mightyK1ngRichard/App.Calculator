//
//  ViewController.swift
//  Calculator
//
//  Created by Dmitriy Permyakov on 11.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var check: Bool = false
    var operation: Int = 0
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.tag
        if check {
            result.text = String(number)
            check = false
        } else {
            if result.text == "0"{
                result.text = ""
            }
            result.text = result.text! + String(number)
        }
        secondNumber = Double(result.text!)!
    }
    
    @IBAction func buttonManagement(_ sender: Any) {
        let tagButton = (sender as! UIButton).tag
        
        if result.text != "0" && tagButton != 10 && tagButton != 17 {
            firstNumber = Double(result.text!)!
        }
        if tagButton == 10{
            result.text = ""
        }
        if tagButton == 13{
            result.text = "/"
            operation = tagButton
            check = true
        } else if tagButton == 14{
            result.text = "x"
            operation = tagButton
            check = true
        } else if tagButton == 15 {
            result.text = result.text! + "-"
            operation = tagButton
            check = true
        } else if tagButton == 16 {
            result.text = "+"
            operation = tagButton
            check = true
        } else if tagButton == 17 {
            if operation == 13 {
                result.text = String(firstNumber / secondNumber)
            } else if operation == 14 {
                result.text = String(firstNumber * secondNumber)
            } else if operation == 15 {
                result.text = String(firstNumber - secondNumber)
            } else if operation == 16 {
                result.text = String(firstNumber + secondNumber)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

