//
//  ViewController.swift
//  Project2
//
//  Created by Arash Zakeresfahani on 3/9/19.
//  Copyright © 2019 Arash Zakeresfahani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var totalNumQuest = 0
   
    

    @IBAction func resetBTN(_ sender: UIButton) {
        score = 0
        totalNumQuest = 0
        askQuestion()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        Button1.layer.borderWidth = 1
        Button2.layer.borderWidth = 1
        Button3.layer.borderWidth = 1
        
        Button1.layer.borderColor = UIColor.lightGray.cgColor
        Button2.layer.borderColor = UIColor.lightGray.cgColor
        Button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(){
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        title = "\(countries[correctAnswer].uppercased()) (\(score))"
        
        Button1.isEnabled = true
        Button2.isEnabled = true
        Button3.isEnabled = true
        Button1.setImage(UIImage(named: countries[0]) , for: .normal)
        Button2.setImage(UIImage(named: countries[1]) , for: .normal)
        Button3.setImage(UIImage(named: countries[2]) , for: .normal)
    }
    
    func gameOver(){
        
        title = "GAMEOVER!!!"
        
        Button1.isEnabled = false
        Button2.isEnabled = false
        Button3.isEnabled = false
        
        Button1.setImage(nil, for: .normal)
        Button1.setTitle("You answered 10 correct questions", for: .disabled)
        Button1.setTitleColor(UIColor.black, for: .disabled)
        
        Button2.adjustsImageWhenDisabled = true
        Button2.setImage(nil, for: .normal)
        Button2.setTitle("Total : \(totalNumQuest)", for: .disabled)
        Button2.setTitleColor(UIColor.black, for: .disabled)
    
        Button3.adjustsImageWhenDisabled = true
        Button3.setImage(nil, for: .normal)
        Button3.setTitle("Wrong : \(totalNumQuest - score)", for: .disabled)
        Button3.setTitleColor(UIColor.black, for: .disabled)
    }
    
    func gameState(action: UIAlertAction! = nil){
        if score == 10 {
            gameOver()
        }else{
            askQuestion()
        }
    }
    
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        
        var title: String
        var msg: String
            if sender.tag == correctAnswer {
                score += 1
                totalNumQuest += 1
                if score == 10{
                    title = "GAMEOVER"
                    msg = "YOU ARE DONE!"
                }else{
                    title = "Correct"
                    msg = "Your Score is \(score)"
                }
            }else{
                title = "WRONG"
                score -= 1
                totalNumQuest += 1
                let flagOrder = ["1st","2nd","3rd"]
                msg = "The correct answer was the \(flagOrder[correctAnswer]) flag"
            }
        
        let ac = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: gameState))
        present(ac, animated: true)
        
    }
    



}

