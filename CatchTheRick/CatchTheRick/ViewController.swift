//
//  ViewController.swift
//  CatchTheRick
//
//  Created by Ömer Faruk Başaran on 19.05.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var imageView5: UIImageView!
    
    @IBOutlet weak var imageView6: UIImageView!
    
    @IBOutlet weak var imageView7: UIImageView!
    
    @IBOutlet weak var imageView8: UIImageView!
    
    @IBOutlet weak var imageView9: UIImageView!
    
    let rick = UIImage(named: "rick")
    
    var timer = Timer()
    var counter = 0
    var score = 0
    var randomNumber = 0
    var changerTimer = Timer()
    var changerCounter = 0
    var lastRick = 0
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageSetup()
        var highScoreStored = UserDefaults.standard.object(forKey: "HighScore")
        if highScoreStored == nil {
             highScore = 0
             highScoreLabel.text = "Highscore: \(highScore)"
         }
         
         if let newScore = highScoreStored as? Int {
             highScore = newScore
             highScoreLabel.text = "Highscore: \(highScore)"
         }
        counter = 10
        changerCounter = 100
        changerTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(changerFunc), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        
        
    }

    @objc func timerFunc() {
        if counter > 0 {
            timeLabel.text = "\(counter)"
        }
        counter -= 1
            if counter == 0 {
                if self.score > self.highScore {
                    self.highScore = self.score
                    self.highScoreLabel.text = "Highscore: \(self.highScore)"
                    UserDefaults.standard.set(self.highScore, forKey: "highscore")
                }

                dispAlert(title: "Time is Up!", message: "Your score: \(score)")
                timeLabel.text = "0"
                changerCounter = 0xFF  // easter-egg :D
                //counter = 10
            }
            
        }
    @objc func changerFunc(){
        changerCounter -= 1
        if changerCounter < 100 {
            switch lastRick {
            case 1:
                imageView1.image = nil
            case 2:
                imageView2.image = nil
            case 3:
                imageView3.image = nil
            case 4:
                imageView4.image = nil
            case 5:
                imageView5.image = nil
            case 6:
                imageView6.image = nil
            case 7:
                imageView7.image = nil
            case 8:
                imageView8.image = nil
            case 9:
                imageView9.image = nil
            default:
                break
            }
            randomNumber = Int.random(in: 1..<10)

            switch randomNumber {
            case 1:
                imageView1.image = rick
                lastRick = 1
            case 2:
                imageView2.image = rick
                lastRick = 2
            case 3:
                imageView3.image = rick
                lastRick = 3
            case 4:
                imageView4.image = rick
                lastRick = 4
            case 5:
                imageView5.image = rick
                lastRick = 5
            case 6:
                imageView6.image = rick
                lastRick = 6
            case 7:
                imageView7.image = rick
                lastRick = 7
            case 8:
                imageView8.image = rick
                lastRick = 8
            case 9:
                imageView9.image = rick
                lastRick = 9
            default:
                break
            }
        }
        
    }
    
    func dispAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { _ in
            self.counter = 10
            self.changerCounter = 100
            self.score = 0
            self.scoreLabel.text = "Score: \(self.score)"
            
        }
        let cancelButton = UIAlertAction(title: "Okay", style: UIAlertAction.Style.cancel)
    
        alert.addAction(cancelButton)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    func imageSetup(){
        imageView1.isUserInteractionEnabled = true
        imageView2.isUserInteractionEnabled = true
        imageView3.isUserInteractionEnabled = true
        imageView4.isUserInteractionEnabled = true
        imageView5.isUserInteractionEnabled = true
        imageView6.isUserInteractionEnabled = true
        imageView7.isUserInteractionEnabled = true
        imageView8.isUserInteractionEnabled = true
        imageView9.isUserInteractionEnabled = true
        
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(Tapped1))
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(Tapped2))
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(Tapped3))
        let gesture4 = UITapGestureRecognizer(target: self, action: #selector(Tapped4))
        let gesture5 = UITapGestureRecognizer(target: self, action: #selector(Tapped5))
        let gesture6 = UITapGestureRecognizer(target: self, action: #selector(Tapped6))
        let gesture7 = UITapGestureRecognizer(target: self, action: #selector(Tapped7))
        let gesture8 = UITapGestureRecognizer(target: self, action: #selector(Tapped8))
        let gesture9 = UITapGestureRecognizer(target: self, action: #selector(Tapped9))
        imageView1.addGestureRecognizer(gesture1)
        imageView2.addGestureRecognizer(gesture2)
        imageView3.addGestureRecognizer(gesture3)
        imageView4.addGestureRecognizer(gesture4)
        imageView5.addGestureRecognizer(gesture5)
        imageView6.addGestureRecognizer(gesture6)
        imageView7.addGestureRecognizer(gesture7)
        imageView8.addGestureRecognizer(gesture8)
        imageView9.addGestureRecognizer(gesture9)
    }
    
    @objc func Tapped1(){
        
        if imageView1.image == rick{
            print("tapped")
            score += 1
            scoreLabel.text = "Score: \(score)"
            imageView1.image = nil
        }
    }
    @objc func Tapped2(){
        
        if imageView2.image == rick{
            print("tapped")
            score += 1
            scoreLabel.text = "Score: \(score)"
            imageView2.image = nil
        }
    }
    @objc func Tapped3(){
        
        if imageView3.image == rick{
            print("tapped")
            score += 1
            scoreLabel.text = "Score: \(score)"
            imageView3.image = nil
        }
    }
    @objc func Tapped4(){
        
        if imageView4.image == rick{
            print("tapped")
            score += 1
            scoreLabel.text = "Score: \(score)"
            imageView4.image = nil
        }
    }
    @objc func Tapped5(){
        
        if imageView5.image == rick{
            print("tapped")
            score += 1
            scoreLabel.text = "Score: \(score)"
            imageView5.image = nil
        }
    }
    @objc func Tapped6(){
        
        if imageView6.image == rick{
            print("tapped")
            score += 1
            scoreLabel.text = "Score: \(score)"
            imageView6.image = nil
        }
    }
    @objc func Tapped7(){
        
        if imageView7.image == rick{
            print("tapped")
            score += 1
            scoreLabel.text = "Score: \(score)"
            imageView7.image = nil
        }
    }
    @objc func Tapped8(){
        
        if imageView8.image == rick{
            print("tapped")
            score += 1
            scoreLabel.text = "Score: \(score)"
            imageView8.image = nil
        }
    }
    @objc func Tapped9(){
        
        if imageView9.image == rick{
            print("tapped")
            score += 1
            scoreLabel.text = "Score: \(score)"
            imageView9.image = nil
        }
    }
    
}

