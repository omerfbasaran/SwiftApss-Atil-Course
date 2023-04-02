//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Ömer Faruk Başaran on 2.04.2023.
//

import UIKit

class SecondViewController: UIViewController {

    var myName = ""
    @IBOutlet weak var textNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        textNameLabel.text = "Name: " + myName
    }
    
}
