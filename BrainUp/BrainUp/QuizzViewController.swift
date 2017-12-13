//
//  QuizzViewController.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 15/03/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//

import UIKit
import GameKit
import Social
import AudioToolbox

class QuizzViewController: UIViewController {

    
    @IBOutlet weak var score: UILabel!
   // var scoreV: Int!
    //year = 2
    var correctQuestionsScore: Int = 0
    var gameSound: SystemSoundID = 0
    var yesSound: SystemSoundID = 1
    var noSound: SystemSoundID = 2
    
    let numberOfQuestions = 8   //the number of questions per round
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var SocialSharing: UIButton!
    //creating a session of roundController with 4 questions per round as default value, this value could be changed editing
    //the numberOfQuestions value.
    var roundController: RoundController = RoundController()
    
    //boolean used to check if the user has answered or not to prevent double answer or skip to the next question without answer
    var answered: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        loadYesSound()
        loadNoSound()
        // Start game
        roundController = RoundController(questionsPerRound: numberOfQuestions)
        playGameStartSound()
        roundController.displayQuestion(questionField, buttons: [answer1Button, answer2Button, answer3Button, answer4Button], objectsToHide:  [wrongLabel, correctLabel, playAgainButton, SocialSharing])
        correctQuestionsScore = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backButton(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    /* ---------------- METHODS ------------------ */
    
    func displayScore() {
        // Hide the answer buttons
        answer1Button.isHidden = true
        answer2Button.isHidden = true
        answer3Button.isHidden = true
        answer4Button.isHidden = true
        wrongLabel.isHidden = true
        correctLabel.isHidden = true
        nextQuestionButton.isHidden = true
        
        if roundController.correctQuestions > 4 {
            let preferences = UserDefaults.standard
            
            let currentLevelQuizzKey = "currentLevelQuizz"
            
            let currentLevelQuizz = 2
            preferences.set(currentLevelQuizz, forKey: currentLevelQuizzKey)
            
            //  Save to disk
            let didSave = preferences.synchronize()
            
            if !didSave {
                //  Couldn't save (I've never seen this happen in real world testing)
            }
        }
        
        
        // Display play again button
        playAgainButton.isHidden = false
        SocialSharing.isHidden = false
        SocialSharing.isEnabled = true
        //BackButton.isHidden = false
        //BackButton.isEnabled = true
        
        questionField.text = "Way to go!\nYou got \(roundController.correctQuestions) out of \(roundController.questionsPerRound) correct!"
        
    }
    
    
    //method called when an answer button is pressed
    @IBAction func checkAnswer(_ sender: UIButton) {
        if !answered {
            answered = true
            let isCorrect: Bool = roundController.checkAnswer(sender, buttons: [answer1Button, answer2Button, answer3Button, answer4Button])
            if isCorrect {
                //if is correct
                playYesSound()
                correctLabel.isHidden = false
               // scoreV++
                correctQuestionsScore += 1
                score.text = String(correctQuestionsScore)
                
                
            } else {
                //if is wrong
                playNoSound()
                wrongLabel.isHidden = false
            }
        }
    }
    
    //method called when the nextQuestionButton is pressed
    @IBAction func nextQuestion(_ sender: AnyObject) {
        if answered {
            nextRound()
            answered = false
        }
    }
    
    
    //method that will be called when playAgain button is pressed
    @IBAction func playAgain() {
        // Show the answer buttons
        answer1Button.isHidden = false
        answer2Button.isHidden = false
        answer3Button.isHidden = false
        answer4Button.isHidden = false
        nextQuestionButton.isHidden = false
        SocialSharing.isHidden = true
        //BackButton.isHidden = true
        //NEED TO RESET VALUES
        
        roundController = RoundController(questionsPerRound: numberOfQuestions)
        nextRound()
    }
    
    @IBAction func SocialShare(_ sender: AnyObject) {
        print("sharing in progress")
        //Alert
        let alert = UIAlertController(title: "Share", message: "Share your IQ score!", preferredStyle: .actionSheet)
        
        //First action
        let actionOne = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
            
            //Checking if user is connected to Facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook)
            {
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                let a = "IQ score"
                let b = String(self.roundController.correctQuestions)
                let ScoreText = a + ": " + b
                post.setInitialText(ScoreText)
                post.add(UIImage(named: "logo"))
                
                self.present(post, animated: true, completion: nil)
                
            } else {
                self.showAlert(service: "Facebook")
            }
        }
        
        //Second action
        let actionTwo = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            
            //Checking if user is connected to Facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter)
            {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                
                let a = "IQ score"
                let b = String(self.roundController.correctQuestions)
                let ScoreText = a + ": " + b
                post.setInitialText(ScoreText)
                //post.setInitialText("IQ score")
                post.add(UIImage(named: "logo"))
                
                self.present(post, animated: true, completion: nil)
                
            } else {self.showAlert(service: "Twitter")}
        }
        
        let actionThree = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //Add action to action sheet
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        alert.addAction(actionThree)
        
        //Present alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(service:String)
    {
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    /* ---------------- HELPER METHODS ------------------ */
    
    //method to skip to the next question/round
    func nextRound() {
        if roundController.isLastRound() {
            // Game is over
            displayScore()
        } else {
            // Continue game
            roundController.displayQuestion(questionField, buttons: [answer1Button, answer2Button, answer3Button, answer4Button], objectsToHide:  [wrongLabel, correctLabel, playAgainButton, SocialSharing])
        }
    }
    
    
    /* ---------------- SOUNDS METHODS ------------------ */
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func loadYesSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "YesSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &yesSound)
    }
    
    func loadNoSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "NoSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &noSound)
    }
    
    func playNoSound() {
        AudioServicesPlaySystemSound(noSound)
    }
    
    func playYesSound() {
        AudioServicesPlaySystemSound(yesSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

