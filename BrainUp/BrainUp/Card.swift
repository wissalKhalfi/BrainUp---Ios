//
//  Card.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 25/02/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//

import UIKit

class Card: NSObject {
    
    var id          : Int
    var display     : Bool
    var image       : UIImage
    var position    : Int = -1
    
    init(image: UIImage) {
        self.id = 0
        self.display = false
        self.image = image
    }
    
    init(card: Card) {
        self.id         = card.id
        self.display    = card.display
        self.image      = card.image
    }
    
    override var description: String {
        return "Card: \(self.id) \(self.display)"
    }
    
    func match(card: Card) -> Bool {
        return self.id == card.id
    }

}
