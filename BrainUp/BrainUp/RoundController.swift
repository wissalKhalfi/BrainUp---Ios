//
//  RoundController.swift
//  QuizzGame
//
//  Created by Andrea Miotto on 26/06/16.
//  Copyright © 2016 Andrea Miotto. All rights reserved.
//

import UIKit
import GameKit


class RoundController {
    var questionsPerRound: Int
    var questionsAsked: Int
    var correctQuestions: Int
    let questionsModel: QuestionsModel
    var selectedQuestion: QuestionModel
    var askedQuestion: [QuestionModel] = []  //collections to keep track of asked question
    
    // -------------------          Color variables to style buttons         ------------
    let normal: UIColor = UIColor(red: 12/255, green: 121/255, blue: 150/255, alpha: 1.0)
    let correct: UIColor = UIColor(red: 102/255, green: 255/255, blue: 144/255, alpha: 1.0)
    let wrong: UIColor = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1.0)
    
    //constructor
    init(questionsPerRound: Int = 4) {
        self.questionsPerRound = questionsPerRound
        questionsAsked = 0
        correctQuestions = 0
        questionsModel = QuestionsModel()
        selectedQuestion = questionsModel.getRandomQuestion()
    }
    
    
    /* ---------------- METHODS ------------------ */
    
    
    //method to check if this round is the last to play
    func isLastRound() -> Bool {
        return questionsAsked == questionsPerRound
    }
    
    
    //method to display question
    func displayQuestion(_ questionLabel: UILabel, buttons: [UIButton], objectsToHide: [UIView]) {
        selectedQuestion = self.nextQuestion()
        askedQuestion.append(selectedQuestion)
        questionLabel.textColor = UIColor.white  //resetting the color label to white
        questionLabel.text = selectedQuestion.question
        //printing the answers into the buttons
        setButtons(buttons, answers: selectedQuestion.answers)
        //hiding the elements to hide
        for i in 0...objectsToHide.count - 1 {
            objectsToHide[i].isHidden = true
        }
    }
    
    
    //method to check answer
    func checkAnswer(_ sender: UIButton, buttons: [UIButton]) -> Bool {
        // Increment the questions asked counter
        questionsAsked += 1
        let isCorrect: Bool = sender.currentTitle == selectedQuestion.getCorrectAnswer()
        displayCorrectAnswer(sender, buttons: buttons, correctAnswer: selectedQuestion.getCorrectAnswer())
        if (isCorrect) {
            correctQuestions += 1
            return true
        } else {
            return false
        }
    }
    
    
    //method to setUo all the answer buttons
    func setButtons(_ buttons: [UIButton], answers: [String]) {
        let difference = buttons.count - answers.count           // the difference between answerButtons and aviable answers for the question
        
        //printing the answers into the buttons
        for i in 0...selectedQuestion.answers.count - 1 {
            setButton(buttons[i], answer: answers[i])
            buttons[i].isHidden = false
        }
        //if nButtons != nAnswers, it hides the buttons we don't need
        if difference != 0 {
            for i in buttons.count - difference...buttons.count - 1{
                buttons[i].isHidden = true
            }
        }
    }
    
    
    
    /* ---------------- HELPER METHODS ------------------ */
    
    //method to grab the next question
    func nextQuestion() -> QuestionModel {
        var next: QuestionModel = questionsModel.getRandomQuestion()
        while alreadyAsked(next) {
            next = questionsModel.getRandomQuestion()
        }
        return next
    }
    
    //method to setUp answer buttons
    func setButton(_ button: UIButton, answer: String) {
        button.setTitle(answer, for: UIControlState())
        resetButtonStyle(button)
    }
    
    //method to check if the questions is already been asked
    func alreadyAsked(_ nextQuestion: QuestionModel) -> Bool {
        return askedQuestion.contains(nextQuestion)
    }
    
    //method to display correct answer
    func displayCorrectAnswer(_ sender: UIButton, buttons: [UIButton], correctAnswer: String) {
        if sender.currentTitle == correctAnswer {
            sender.backgroundColor = correct
        } else {
            sender.backgroundColor = wrong
            for i in 0...buttons.count - 1 {
                if buttons[i].currentTitle == correctAnswer {
                    buttons[i].backgroundColor = correct
                }
            }
        }
    }
    
    //method to reset button style
    func resetButtonStyle(_ button: UIButton) {
        button.backgroundColor = normal
    }
    
    
}
