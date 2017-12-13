//
//  MemoryGame2.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 25/02/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//

import UIKit
import GameKit

class MemoryGame2: NSObject {
    
    var cardImages      : [UIImage] = [
        UIImage(named: "Account-128")!,
        UIImage(named: "Audio-128")!,
        UIImage(named: "Chat2-128")!,
        UIImage(named: "Close-128")!,
        UIImage(named: "Mail-128")!,
        UIImage(named: "Menu_green-128")!,
        UIImage(named: "Settings-128")!,
        UIImage(named: "Clock-128")!,
        UIImage(named: "Command-128")!,
        UIImage(named: "Compose-128")!,
        UIImage(named: "Edit-128")!,
        UIImage(named: "Folder-128")!
    ]
    
    var animationDelegate       : MemoryAnimationDelegate?
    var cards                   : [Card] = [Card]()
    var displayedCards          : [Card] = [Card]()
    
    var isPlaying   : Bool = false
    
    func startGame(cardImages: [UIImage]) -> [Card] {
        var result : [Card] = [Card]()
        var idCounter = 1;
        for image in cardImages {
            // Create the card using an image
            let card = Card.init(image: image)
            card.id = idCounter
            // Increase the counter
            idCounter += 1
            
            let secondCard : Card = Card.init(card: card);
            // Add the card to the result array.
            result.append(card)
            result.append(secondCard)
        }
        
        result = GKRandomSource.sharedRandom()
            .arrayByShufflingObjects(in: result) as! [Card]
        displayedCards.removeAll()
        isPlaying = true
        return result
    }

    func pickCard(pickedCard: Card) {
       
        
        // Basic validation
        if(displayedCards.contains(pickedCard)) {
            
            return
        }
        
        pickedCard.display = true
        
        // Show animation
        
        if (displayedCards.count != 0 && displayedCards.count % 2 == 1) {
            // There is a previous card displayed
            let lastCard = displayedCards.last!
            if(lastCard.match(card: pickedCard)) {
                displayedCards.append(pickedCard)
               
            } else {
                displayedCards.removeLast()
                lastCard.display = false;
                
                pickedCard.display = false;
                // Show animation to hide card
                animationDelegate?.showCard(card: pickedCard)
                
                // Show animation to hide card
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1,
                                              execute: {
                    self.animationDelegate?.hideCard(card: lastCard)
                    self.animationDelegate?.hideCard(card: pickedCard)
                })
            }
        } else {
            // There is no previous card displayed
            displayedCards.append(pickedCard)
        }
    }

}
