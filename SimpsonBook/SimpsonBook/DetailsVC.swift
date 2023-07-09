//
//  DetailsVC.swift
//  SimpsonBook
//
//  Created by Ömer Faruk Başaran on 9.07.2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var jobLabel: UILabel!
    
    var selectedChar : Characters?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedChar?.name
        jobLabel.text = selectedChar?.job
        imageView.image = selectedChar?.image
        // Do any additional setup after loading the view.
    }


}
