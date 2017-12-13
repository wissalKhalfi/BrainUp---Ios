//
//  ViewController.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 06/04/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//
import UIKit

class MemoryLev3: UIViewController {
    
   
 
    //@IBOutlet weak var memoryBoard: UICollectionView!
    
    var memoryGame: MemoryGame2 = MemoryGame2();
    
    @IBOutlet weak var memoryBoard: UICollectionView!
    
    //var memoryGame1: MemoryGame1 = MemoryGame1();
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        memoryGame.cards = memoryGame.startGame(cardImages: memoryGame.cardImages)
        memoryGame.animationDelegate = self
        memoryBoard.backgroundColor = UIColor(white: 1, alpha: 0)
        memoryBoard.dataSource = self
        memoryBoard.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButton(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension MemoryLev3 : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //let memoryGame: MemoryGame = MemoryGame();
        return memoryGame.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cardCell", for: indexPath) as! CardCellCollectionViewCell
        
       //let memoryGame: MemoryGame = MemoryGame();
        cell.id = memoryGame.cards[indexPath.row].id
        cell.image.image = memoryGame.cards[indexPath.row].image
        cell.background.image = UIImage(named: "question_mark")!
        cell.backgroundColor = UIColor(white: 1, alpha: 0)
        memoryGame.cards[indexPath.row].position = indexPath.row
        
        if memoryGame.cards[indexPath.row].display {
            cell.image.isHidden = false
            cell.background.isHidden = true
        } else {
           cell.image.backgroundColor = UIColor(white: 1, alpha: 0)
            cell.image.isHidden = true
            cell.background.isHidden = false
            
        }
        
        return cell;
        
    }
    
}

extension MemoryLev3 : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCellCollectionViewCell
        if cell.isDisplay {
            return
        }
       // var memoryGame: MemoryGame = MemoryGame();
        cell.showCard(show: true);
        memoryGame.pickCard(pickedCard: memoryGame.cards[indexPath.row])
        if memoryGame.displayedCards.count == 24 {
            let preferences = UserDefaults.standard
            
            let currentLevelMemoryKey = "currentLevel"
            
            let currentLevel = 4
            preferences.set(currentLevel, forKey: currentLevelMemoryKey)
            
            //  Save to disk
            let didSave = preferences.synchronize()
            
            if !didSave {
                //  Couldn't save (I've never seen this happen in real world testing)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 60, height: 60)
    }
    
}

extension MemoryLev3 : MemoryAnimationDelegate {
    
    func showCard(card: Card) {
        if let cell = memoryBoard.cellForItem(at:
            IndexPath(row: card.position, section: 0))
            as! CardCellCollectionViewCell?
        {
            cell.showCard(show: true)
        }
    }
    
    func hideCard(card: Card) {
        if let cell = memoryBoard.cellForItem(at:
            IndexPath(row: card.position, section: 0))
            as! CardCellCollectionViewCell?
        {
            cell.showCard(show: false)
        }
    }
    
}

