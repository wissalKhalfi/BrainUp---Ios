//
//  QuestionsModel4.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 15/03/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//

import GameKit


struct QuestionsModel4 {
    
    //Array of all questions
    var questions: [QuestionModel] = [
        QuestionModel(
            question: "This was the only US President to serve more than two consecutive terms.",
            answers: ["George Washington", "Franklin D. Roosevelt", "Woodrow Wilson", "Andrew Jackson"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "Which of the following countries has the most residents?",
            answers: ["Nigeria", "Russia", "Iran", "Vietnam"],
            correctAnswer: 0
        ),
        QuestionModel(
            question: "In what year was the United Nations founded?",
            answers: ["1918", "1919", "1945", "1954"],
            correctAnswer: 2
        ),
        QuestionModel(
            question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
            answers: ["Paris", "Washington D.C.", "New York City", "Boston"],
            correctAnswer: 2
        ),
        QuestionModel(
            question: "Which nation produces the most oil?",
            answers: ["Iran", "Iraq", "Brazil", "Canada"],
            correctAnswer: 3
        ),
        QuestionModel(
            question: "Which country has most recently won consecutive World Cups in Soccer?",
            answers: ["Italy", "Brazil", "Argetina", "Spain"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "Which of the following rivers is longest?",
            answers: ["Yangtze", "Mississippi", "Congo", "Mekong"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "Which city is the oldest?",
            answers: ["Mexico City", "Cape Town", "San Juan", "Sydney"],
            correctAnswer: 0
        ),
        QuestionModel(
            question: "Which of these countries won the most medals in the 2012 Summer Games?",
            answers: ["France", "Germany", "Japan", "Great Britain"],
            correctAnswer: 3
        ),
        QuestionModel(
            question: "Which country was the first to allow women to vote in national elections?",
            answers: ["Poland", "United States", "Sweden", "Senegal"],
            correctAnswer: 0
        ),
        QuestionModel(
            question: "Blue whales are technically whales",
            answers: ["True", "False"],
            correctAnswer: 0
        ),
        QuestionModel(
            question: "Only female koalas can whistle",
            answers: ["True", "False"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "Camels are cannibalistic",
            answers: ["True", "False"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "All ducks are birds",
            answers: ["True", "False"],
            correctAnswer: 0
        ),
        QuestionModel(
            question: "Which car company launched the Prius model", //<<<<<<
            answers: ["Fiat", "Toyota", "BMW"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "What company launched the S6 Edge smartphone?",
            answers: ["Apple", "Sony", "Samsung"],
            correctAnswer: 2
        ),
        QuestionModel(
            question: "The game of Monopoly celebrated what anniversary in 2015:",
            answers: ["40th", "80th", "60th"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "The 2015 Mad Max movie is sub-titled:",
            answers: ["Fury Road", "Angry Avenue", "Happy Highway"],
            correctAnswer: 0
        ),
        QuestionModel(
            question: "The Magna Carta, signed in London, was how many years old in 2015",
            answers: ["400", "800", "1000"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "According to 2015 survey what fruit was most popular among USA children?",
            answers: ["Banana", "Orange", "Apple"],
            correctAnswer: 2
        ),
        QuestionModel(
            question: "Jon Snow was killed off in what series in 2015?",
            answers: ["House of Cards", "Game of Thrones", "The Walking Dead"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "How many years old was the McDonalds fast food company in 2015?",
            answers: ["20", "80", "60"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "Someone of stubbornly set ways is said to be 'Dyed in the (What?)",
            answers: ["Wool", "Cotton", "Silk"],
            correctAnswer: 0
        ),
        QuestionModel(
            question: "To commit to a difficult decision/action is to 'Bite the (what?)",
            answers: ["Bottle", "Bullet", "Bacaon"],
            correctAnswer: 1
        )
        ]
    
    /* ---------------- METHODS ------------------ */
    
    
    //Method to get a random question
    func getRandomQuestion() -> QuestionModel {
        let indexOfSelectedQuestion: Int = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        return questions[indexOfSelectedQuestion]
    }
    
    
    
}
