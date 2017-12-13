//
//  MemoryMainSelectLevelViewController.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 06/04/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//

import UIKit

class IQMainSelectLevelViewController : UIViewController {
    
    
    
    
    @IBOutlet weak var Lev1: UIButton!
    
    
    @IBOutlet weak var Lev2: UIButton!
    
    @IBOutlet weak var Lev3: UIButton!
    
    
    @IBOutlet weak var Lev4: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = UserDefaults.standard
        
        
        let currentLevelQuizzKey = "currentLevelQuizz"
        
        if preferences.object(forKey: currentLevelQuizzKey) == nil {
            
            //let preferences = UserDefaults.standard
            
           // let currentLevelMemoryKey = "currentLevel"
            //let currentLevelQuizzKey = "currentLevelQuizz"
            
            //let currentLevel = 1
            let currentLevelQuizz = 1
            //preferences.set(currentLevel, forKey: currentLevelMemoryKey)
            preferences.set(currentLevelQuizz, forKey: currentLevelQuizzKey)
            
            //  Save to disk
            let didSave = preferences.synchronize()
            
            if !didSave {
                //  Couldn't save (I've never seen this happen in real world testing)
            }
            
            
        } else {
            let currentLevelQuizz = preferences.integer(forKey: currentLevelQuizzKey)
      
            print("Level playing: " )
            print( currentLevelQuizz)
            
            if currentLevelQuizz == 1 {
                
                Lev1.setImage(UIImage(named: "IQ1"), for: .normal)
                Lev2.isEnabled = false
                Lev3.isEnabled = false
                Lev4.isEnabled = false
                
            }
            else if currentLevelQuizz == 2 {
                Lev2.isEnabled = true
                Lev3.isEnabled = false
                Lev4.isEnabled = false
                Lev1.setImage(UIImage(named: "IQ1"), for: .normal)
                Lev2.setImage(UIImage(named: "IQ2"), for: .normal)
                
            }
            else if currentLevelQuizz == 3 {
                Lev2.isEnabled = true
                Lev3.isEnabled = true
                Lev4.isEnabled = false
                Lev1.setImage(UIImage(named: "IQ1"), for: .normal)
                Lev2.setImage(UIImage(named: "IQ2"), for: .normal)
                Lev3.setImage(UIImage(named: "IQ3"), for: .normal)
            }
            else if currentLevelQuizz == 4 {
                Lev2.isEnabled = true
                Lev3.isEnabled = true
                Lev4.isEnabled = true
                Lev1.setImage(UIImage(named: "IQ1"), for: .normal)
                Lev2.setImage(UIImage(named: "IQ2"), for: .normal)
                Lev3.setImage(UIImage(named: "IQ3"), for: .normal)
                Lev4.setImage(UIImage(named: "IQ4"), for: .normal)
            }
        }

       
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        let preferences = UserDefaults.standard
        
        
        let currentLevelQuizzKey = "currentLevelQuizz"
        
        if preferences.object(forKey: currentLevelQuizzKey) == nil {
            //  Doesn't exist
        } else {
            let currentLevelQuizz = preferences.integer(forKey: currentLevelQuizzKey)
            
            print("Level playing: " )
            print( currentLevelQuizz)
            
            if currentLevelQuizz == 1 {
                Lev2.isEnabled = false
                Lev3.isEnabled = false
                Lev4.isEnabled = false
                
               Lev1.setImage(UIImage(named: "IQ1"), for: .normal)
               /* Lev2.setImage(UIImage(named: "boo"), for: .normal)
                Lev3.setImage(UIImage(named: "boo"), for: .normal)
                Lev4.setImage(UIImage(named: "boo"), for: .normal)*/
            }
            else if currentLevelQuizz == 2 {
                Lev2.isEnabled = true
                Lev3.isEnabled = false
                Lev4.isEnabled = false
                Lev1.setImage(UIImage(named: "IQ1"), for: .normal)
                Lev2.setImage(UIImage(named: "IQ2"), for: .normal)
                //Lev3.setImage(UIImage(named: "boo"), for: .normal)
                //Lev4.setImage(UIImage(named: "boo"), for: .normal)
                
            }
            else if currentLevelQuizz == 3 {
                Lev2.isEnabled = true
                Lev3.isEnabled = true
                Lev4.isEnabled = false
                Lev1.setImage(UIImage(named: "IQ1"), for: .normal)
                Lev2.setImage(UIImage(named: "IQ2"), for: .normal)
                Lev3.setImage(UIImage(named: "IQ3"), for: .normal)
                //Lev4.setImage(UIImage(named: "boo"), for: .normal)
            }
            else if currentLevelQuizz == 4 {
                Lev2.isEnabled = true
                Lev3.isEnabled = true
                Lev4.isEnabled = true
                Lev1.setImage(UIImage(named: "IQ1"), for: .normal)
                Lev2.setImage(UIImage(named: "IQ2"), for: .normal)
                Lev3.setImage(UIImage(named: "IQ3"), for: .normal)
                Lev4.setImage(UIImage(named: "IQ4"), for: .normal)
            }
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func backButton(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
