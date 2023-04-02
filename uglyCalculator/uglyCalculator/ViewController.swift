//
//  ViewController.swift
//  uglyCalculator
//
//  Created by Ömer Faruk Başaran on 25.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var firstNumberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func plusButton(_ sender: Any) {
        var value : Int
        if let result = Int(firstNumberTextField.text ?? ""){
            value = result
            
            if let result2 = Int(secondNumberTextField.text ?? ""){
                value += result2
                resultTextLabel.text = String(value)
                resultTextLabel.isHidden = false
            }
        }
        
    }
    
    @IBAction func minusButton(_ sender: Any) {
        var value : Int
        if let result = Int(firstNumberTextField.text ?? ""){
            value = result
            
            if let result2 = Int(secondNumberTextField.text ?? ""){
                value -= result2
                resultTextLabel.text = String(value)
                resultTextLabel.isHidden = false
            }
        }
    }
    @IBAction func mulButton(_ sender: Any) {
        var value : Int
        if let result = Int(firstNumberTextField.text ?? ""){
            value = result
            
            if let result2 = Int(secondNumberTextField.text ?? ""){
                value *= result2
                resultTextLabel.text = String(value)
                resultTextLabel.isHidden = false
            }
        }
    }
    @IBAction func divideButton(_ sender: Any) {
        var value : Int
        if let result = Int(firstNumberTextField.text ?? ""){
            value = result
            
            if let result2 = Int(secondNumberTextField.text ?? ""){
                value /= result2
                resultTextLabel.text = String(value)
                resultTextLabel.isHidden = false
            }
        }
    }
}

