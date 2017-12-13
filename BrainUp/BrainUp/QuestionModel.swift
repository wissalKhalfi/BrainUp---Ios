//
//  QuestionModel.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 15/03/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//

struct QuestionModel: Equatable {
    
    let question: String
    let answers: [String]
    let correctAnswer: Int
    
    //method to get the correct answer
    func getCorrectAnswer() -> String {
        return answers[correctAnswer]
    }
    
}

//Overriding the == operator at the global scope when it is used on two QuestionModel.
func == (lhs: QuestionModel, rhs: QuestionModel) -> Bool {
    return lhs.question == rhs.question
}



