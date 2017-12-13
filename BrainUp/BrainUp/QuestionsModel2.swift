//
//  QuestionsModel2.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 15/03/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//
import GameKit


struct QuestionsModel2 {
    
    //Array of all questions
    var questions: [QuestionModel] = [
        QuestionModel(
            question: "In which decade was the American Institute of Electrical Engineers (AIEE) founded?",
            answers: ["1850s", "1880s", "1930s", "1950s"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "What is part of a database that holds only one type of information?",
            answers: ["Report", "Field", "Record", "File"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "'OS' computer abbreviation usually means ?",
            answers: ["Order of Significance", "Open Software", "Operating System", "Optical Sensor"],
            correctAnswer: 2
        ),
        QuestionModel(
            question: "In which decade with the first transatlantic radio broadcast occur?",
            answers: ["1850s", "1880s", "1870s", "1900s"],
            correctAnswer: 3
        ),
        QuestionModel(
            question: "Who developed Yahoo?",
            answers: ["Dennis Ritchie & Ken Thompson", "David Filo & Jerry Yang", "Vint Cerf & Robert Kahn", "Steve Case & Jeff Bezos"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "The most common format for a home video recorder is VHS. VHS stands for...?",
            answers: ["Video Home System", "Very high speed", "Video horizontal standard", "Voltage house standard"],
            correctAnswer: 0
        ),
        QuestionModel(
            question: " 'DB' computer abbreviation usually means ?",
            answers: ["Database", "Data Block", "Double Byte", "Driver Boot"],
            correctAnswer: 0
        ),
        QuestionModel(
            question: "'.INI' extension refers usually to what kind of file?",
            answers: ["Image File", "System file", "Hypertext Related File", "Image Color Matching Profile file"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "What do we call a collection of two or more computers that are located within a limited distance of each other and that are connected to each other directly or indirectly?",
            answers: ["Inernet", "LAN", "WAN", "Interanet"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "In what year was the '@' chosen for its use in e-mail addresses?",
            answers: ["1972", "1976", "1980", "1984"],
            correctAnswer: 0
        ),
        QuestionModel(
            question: "Who built the world's first binary digit computer: Z1...?",
            answers: ["Konrad Zuse", "Ken Thompson", "Alan Turing", "George Boole"],
            correctAnswer: 0
        ),
        QuestionModel(
            question: "Technology is the use of science to solve practical problems",
            answers: ["True", "False"],
            correctAnswer: 0
        ),
        QuestionModel(
            question: "Virus is a computer program unintentionally designed to cause annoyance or damage hardware or software",
            answers: ["True", "False"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "Mac used microsoft windows operating system",
            answers: ["True", "False"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: " What's a web browser?",
            answers: ["A computer that stores WWW files", "A kind of spider", "A software program that allows you to access sites on the World Wide Web"],
            correctAnswer: 2
        ),
        QuestionModel(
            question: "How many bits is a byte?",
            answers: ["4", "8", "16"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: " Which device can be used to store charge?",
            answers: ["Diode", "Capacitor"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "Your computer has gradually slowed down. What's the most likely cause?",
            answers: ["Overheating", "Adware/spyware is infecting your PC", "You dropped a sandwich in your computer"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "A JPG is...",
            answers: ["A unit of measure for memory", "A format for an image file", "A type of hard disk"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "Which company created the most used networking software in the 1980's",
            answers: ["Microsoft", "Sun", "Novell"],
            correctAnswer: 2
        ),
        QuestionModel(
            question: "Which of the following operating systems is produced by IBM?",
            answers: ["UNIX", "OS-2"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "What is a spider?",
            answers: ["A hacker who breaks into computer systems", "A program that catalogs Web sites"],
            correctAnswer: 1
        ),
        QuestionModel(
            question: "The abbreviation URL stands for:",
            answers: ["User Regulation Law", "Ultimate RAM Locator", "Uniform Resource Locator"],
            correctAnswer: 0
        ),
        QuestionModel(
            question: "What is the Websites code for the country Spain?",
            answers: ["SP", "ES"],
            correctAnswer: 1
        )
        ]
    
    /* ---------------- METHODS ------------------ */
    
    
    //Method to get a random question
    func getRandomQuestion() -> QuestionModel {
        let indexOfSelectedQuestion: Int = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        return questions[indexOfSelectedQuestion]
    }
    
    //back: self.dismiss
    //design about
    //back in level
    //profiling
    //hide keyboard while registering
    //Memory game cards
    
    
}
