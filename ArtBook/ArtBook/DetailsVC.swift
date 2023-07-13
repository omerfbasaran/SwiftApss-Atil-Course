//
//  DetailsVC.swift
//  ArtBook
//
//  Created by Ömer Faruk Başaran on 11.07.2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var artistTextField: UITextField!
    
    @IBOutlet weak var yearTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        // Do any additional setup after loading the view.
    }
    
    @objc func closeKeyboard(){
        view.endEditing(true)
        print("test")
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
    }
    
}
