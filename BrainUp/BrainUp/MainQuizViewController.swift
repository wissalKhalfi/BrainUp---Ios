//
//  MainQuizController.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 25/04/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//

import UIKit

class MainQuizViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back(_ sender: AnyObject) {
        print("back printed")
        dismiss(animated: true, completion: nil)
    }
    
}


  
