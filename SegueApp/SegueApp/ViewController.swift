//
//  ViewController.swift
//  SegueApp
//
//  Created by Ömer Faruk Başaran on 2.04.2023.
//

import UIKit

class ViewController: UIViewController {
    var userName = ""
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        nameTextField.text = ""
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        userName = nameTextField.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC"{
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myName = userName
            
        }
        }

    
}

