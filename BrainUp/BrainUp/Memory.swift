//
//  Memory.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 25/04/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//

import Foundation

class Memory {
    
    var idmemory: Int?
    var idPl : Int?
    var mem_best1 : Int?
    var mem_best2 : Int?
    var mem_best3 : Int?
    var mem_best4 : Int?
    
    
    
    required init?(idmem: Int?,idplayer: Int? ,b1: Int?, b2: Int?, b3: Int?, b4: Int?) {
        self.idmemory = idmem
        self.idPl = idplayer
        self.mem_best1 = b1
        self.mem_best2 = b2
        self.mem_best3 = b3
        self.mem_best4 = b4
        
    }
    
    func description() -> String {
        return " player id: \(self.idPl)" +
            "id memory: \(self.idmemory)" +
            "best score level 1: \(self.mem_best1)\n" +
            "best score level 2: \(self.mem_best2)\n" +
            "best score level 3: \(self.mem_best3)\n" +
            "best score level 4: \(self.mem_best4)\n"
        
    }
}
