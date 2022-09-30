//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionText: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    
    
    var quizBrain = QuizBrain()
  
    
 
    
    
    
    override func viewDidLoad() { // view by default
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }
    
    
    
    @IBAction func answerButtonPress(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //string true false
        let userGotItRight = quizBrain.checkAnswer(answer: userAnswer) //bool true false
        
        if userGotItRight { // color
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        
        quizBrain.getQuestionNumber()
       
        
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
         
     }
    
    @objc func updateUI() {
        
        questionText.text = quizBrain.getQuestionText()

        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        progressBar.progress = quizBrain.getProgress()
        
    }
    
}

