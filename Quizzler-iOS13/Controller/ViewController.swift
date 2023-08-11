//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        updateUI()
        progressBar.progress = 0.0
    }

    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer!)
        
        if userGotItRight {
           
            sender.backgroundColor = UIColor.green
            
        }
        else {
            
            sender.backgroundColor = UIColor.red
            
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
   @objc func updateUI() {
        
       questionLabel.text = quizBrain.getQuestionText()
       scoreLabel.text = "Score: \(quizBrain.getScore())"
       trueButton.backgroundColor = UIColor.clear
       falseButton.backgroundColor = UIColor.clear
       let quizFloat = Float(quizBrain.quiz.count - 1)
       
       if progressBar.progress < 1.0 {
           
           progressBar.progress += 1.0 / quizFloat
       }
       else if progressBar.progress == 1.0 {
          
           progressBar.progress = 0.0
       }
       
    }
    
    
    
    
}

