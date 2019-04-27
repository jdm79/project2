//
//  ViewController.swift
//  Project2
//
//  Created by James Daniel Malvern on 09/04/2019.
//  Copyright © 2019 Malvernation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var questionCount = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScoreTapped))
        
        countries += ["estonia", "france", "germany", "ireland",
                      "italy", "monaco", "nigeria", "poland",
                      "russia", "spain","uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "\(score)/\(questionCount) | \(countries[correctAnswer].uppercased())?"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        if(sender.tag == correctAnswer) {
            title = "Correct"
            message = "\(countries[sender.tag].uppercased()) indeed"
            score += 1
        } else {
            title = "Incorrect"
            message = "This flag's \(countries[sender.tag].uppercased())"
            score += 0
        }
        questionCount += 1

        
        if(questionCount == 10) {
            let ac = UIAlertController(title: "Game Over", message: "You scored \(score)/\(questionCount)", preferredStyle: .alert)
           
            gameOver()
            
            ac.addAction(UIAlertAction(title: "Play again", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
           
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
        }
    }
    
    func gameOver() {
        questionCount = 0
        score = 0
    }
    
    @objc func showScoreTapped() {
        
        let title = "Score: \(score)"
        let message = "Keep going!"
        let ss = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        ss.addAction(UIAlertAction(title: "Continue", style: .default))
        
        present(ss, animated: true)
    }
}

