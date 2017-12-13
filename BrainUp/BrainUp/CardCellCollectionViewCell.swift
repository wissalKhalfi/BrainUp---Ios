//
//  CardCellCollectionViewCell.swift
//  MemoryGame
//
//  Created by Roque Rueda on 22/02/17.
//  Copyright © 2017 HCL. All rights reserved.
//

import UIKit

class CardCellCollectionViewCell: UICollectionViewCell {

    var img         : UIImage = UIImage()
    var id          : Int = 0
    var isDisplay   : Bool = false
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var background: UIImageView!
    
    func showCard(show: Bool) {
        self.image.isHidden = true
        self.background.isHidden = true
        
        if show {
            isDisplay = true
            UIView.transition(from: background, to: image, duration: 1,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
            
        } else {
            isDisplay = false
            UIView.transition(from: image, to: background, duration: 1,
                              options: [.transitionFlipFromRight, .showHideTransitionViews],
                              completion: nil)
        }
        
        
        
    }
}
