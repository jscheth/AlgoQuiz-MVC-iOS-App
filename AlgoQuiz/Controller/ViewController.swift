//
//  ViewController.swift
//  AlgoQuiz
//
//  Created by Jonathan Cheth on 3/30/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizLogic = QuizLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Button Pressed: \(sender.configuration?.title ?? "No title")")
        
        let userAnswer = sender.configuration?.title ?? "No title"
        print("User Answer: \(userAnswer)")
        
        let answerCheck = quizLogic.checkAnswer(userAnswer: userAnswer)
        print("Answer Correct: \(answerCheck)")

        DispatchQueue.main.async {
            if answerCheck {
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
            }
        }

        quizLogic.nextQuestion()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.updateUI()
        }
    }
    
    func updateUI() {
        questionLabel.text = quizLogic.getQuestion()
        progressView.progress = quizLogic.getProgress()
        scoreLabel.text = "Score: \(quizLogic.getScore())"
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

