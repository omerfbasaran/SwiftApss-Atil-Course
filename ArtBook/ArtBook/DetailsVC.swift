//
//  DetailsVC.swift
//  ArtBook
//
//  Created by Ömer Faruk Başaran on 11.07.2023.
//

import UIKit
import CoreData

class DetailsVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var artistTextField: UITextField!
    
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var chosenPainting = ""
    var chosenPaintingId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenPainting != "" {
            
            saveButton.isHidden = true
            
            let idString = chosenPaintingId?.uuidString
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey: "name") as? String{
                            nameTextField.text = name
                        }
                        if let artist = result.value(forKey: "artist") as? String{
                            artistTextField.text = artist
                        }
                        if let year = result.value(forKey: "year") as? Int{
                            yearTextField.text = String(year)
                        }
                        if let image = result.value(forKey: "image") as? Data{
                            imageView.image = UIImage(data: image)
                        }
                    }
                }
                
                }  catch {
                    
                }
            
        } else {
            saveButton.isHidden = false
            saveButton.isEnabled = false
        }
        
        view.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapGestureRecognizer)
       
    }
    
    @objc func closeKeyboard(){
        view.endEditing(true)
        print("test")
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        newPainting.setValue(nameTextField.text ?? "", forKey: "name")
        newPainting.setValue(artistTextField.text ?? "", forKey: "artist")
        
        if let year = Int(yearTextField.text!) {
            newPainting.setValue(year, forKey: "year")
        }
        
        newPainting.setValue(UUID(), forKey: "id")
        
        let imageData = imageView.image?.jpegData(compressionQuality: 0.5)
        newPainting.setValue(imageData, forKey: "image")
        
        do {
            try context.save()
            print("saved Succes")
        }   catch {
            print("error when saved")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("newDataPosted"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true)
    }
}
