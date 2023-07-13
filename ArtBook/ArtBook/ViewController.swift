//
//  ViewController.swift
//  ArtBook
//
//  Created by Ömer Faruk Başaran on 11.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusClicked))
        // Do any additional setup after loading the view.
    }
    @objc func plusClicked() {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }

}

