//
//  Quiz.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 25/04/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//

import Foundation

class Quiz {
    
    var id: Int?
    var idPlayer : Int?
    var best1 : Int?
    var best2 : Int?
    var best3 : Int?
    var best4 : Int?
    
    
    
    required init?(idquiz: Int?,idplayer: Int? ,b1: Int?, b2: Int?, b3: Int?, b4: Int?) {
        self.id = idquiz
        self.idPlayer = idplayer
        self.best1 = b1
        self.best2 = b2
        self.best3 = b3
        self.best4 = b4
        
    }
    
    func description() -> String {
        return " player id: \(self.idPlayer)" +
            "id quizz: \(self.id)" +
            "best score level 1: \(self.best1)\n" +
            "best score level 2: \(self.best2)\n" +
            "best score level 3: \(self.best3)\n" +
            "best score level 4: \(self.best4)\n"
        
    }
}
