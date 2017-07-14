//
//  ViewController.swift
//  Proyecto 2
//
//  Created by Nach on 07/07/2017.
//  Copyright © 2017 Nach. All rights reserved.
//

import UIKit
import GameplayKit

// Hola
class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var bottomBox: UILabel!
    @IBOutlet weak var topBox: UILabel!

    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco",
                      "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        btn1.layer.borderWidth = 1
        btn2.layer.borderWidth = 1
        btn3.layer.borderWidth = 1
        bottomBox.layer.borderWidth = 1
        bottomBox.text = "0"
        topBox.layer.borderWidth = 1

        
        askQuestion()

    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]

        btn1.setImage(UIImage(named: countries[0]), for: .normal)
        btn2.setImage(UIImage(named: countries[1]), for: .normal)
        btn3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()


    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        }
        else{
            title = "Wrong"
            score -= 2
        }
        
        let mytext = "Your score is: \(score)"

        let ac = UIAlertController(title: title, message: mytext, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        ac.addAction(UIAlertAction(title: "Quit", style: .cancel, handler: askQuestion))
        bottomBox.text = "\(score)"
        let msg = "DEJA YA DE JUGAR"
        let ac2 = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        ac2.addAction(UIAlertAction(title: "Quit", style: .destructive, handler: askQuestion))
        

        
    
        if(score <= -10){
            present(ac2, animated: true)
        
        }
        else{
            present(ac, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

