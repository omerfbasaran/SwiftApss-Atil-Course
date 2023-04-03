//
//  ViewController.swift
//  AlertProject
//
//  Created by Ömer Faruk Başaran on 3.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var password2Textfield: UITextField!
    
    var userName = ""
    var password = ""
    var password2 = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signupClicked(_ sender: Any) {
        userName = usernameTextfield.text!
        password = passwordTextfield.text!
        password2 = password2Textfield.text!
        
        if userName == "" {
            if password == "" {
                dispAlert(title: "Error!", message: "Username and Password can't be empty!")
            }
            else if password != password2{
                dispAlert(title: "Error!", message: "Username can't be empty and Password is not match!")
            }
            dispAlert(title: "Error!", message: "Username can't be empty!")
        }
        else if password == "" {
            dispAlert(title: "Error!", message: "Password can't be empty!")
        }
        else if password2 == "" {
            dispAlert(title: "Error!", message: "Password correction can't be empty!")
        }
        else if password != password2 {
            dispAlert(title: "Error!", message: "Password do not match!")
        }
        else if password == password2 {
            dispAlert(title: "Success!", message: "You sign up successfuly!")
        }
    }

    func dispAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

