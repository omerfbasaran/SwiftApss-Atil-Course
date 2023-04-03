//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Ömer Faruk Başaran on 3.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
    var isNida = true
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(Tapped) )
        imageView.addGestureRecognizer(gesture)
    }

    @objc func Tapped(){
        
        if isNida {
            imageView.image = UIImage(named: "omer")
            myLabel.text = "Ömer"
            isNida = false
        }
        else {
            imageView.image = UIImage(named: "nida")
            myLabel.text = "Nidyanna"
            isNida = true
        }
    }
}

