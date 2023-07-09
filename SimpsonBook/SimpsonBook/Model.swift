//
//  Model.swift
//  SimpsonBook
//
//  Created by Ömer Faruk Başaran on 9.07.2023.
//

import Foundation
import UIKit

class Characters {
    var name : String
    var job : String
    var image : UIImage
    
    init(name: String, job: String, image: UIImage) {
        self.name = name
        self.job = job
        self.image = image
    }
}
