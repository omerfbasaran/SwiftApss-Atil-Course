//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Ömer Faruk Başaran on 9.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedChar : Characters?
    var testLabel = "Test"
    var spCharacters = [Characters]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        let sponge = Characters(name: "SpongeBob SquarePants", job: "Cook", image: UIImage(named: "Sponge")!)
        let patrick = Characters(name: "Patrick Star", job: "Unemployed", image: UIImage(named: "Patrick")!)
        let squid = Characters(name: "Squidward Tentacles", job: "Cashier", image: UIImage(named: "Squid")!)
        let krabs = Characters(name: "Eugene H. Krabs", job: "Owner and founder of the Krusty Krab", image: UIImage(named: "Krabs")!)
        let sandy = Characters(name: "Sandy Cheeks", job: "Scientist", image: UIImage(named: "Sandy")!)
        let gary = Characters(name: "Gary the Snail", job: "Pet", image: UIImage(named: "Gary")!)
        
        spCharacters.append(sponge)
        spCharacters.append(patrick)
        spCharacters.append(squid)
        spCharacters.append(krabs)
        spCharacters.append(sandy)
        spCharacters.append(gary)
    }

    
}
extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spCharacters.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = spCharacters[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedChar = spCharacters[indexPath.row].self
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! DetailsVC
        
        viewController.selectedChar = self.selectedChar
    }
}

