//
//  LoginViewController.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 12/04/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//

import UIKit
import Alamofire
import FBSDKCoreKit
import FBSDKLoginKit
import NVActivityIndicatorView

class LoginViewController: UIViewController , FBSDKLoginButtonDelegate ,  NVActivityIndicatorViewable {
    
    @IBOutlet weak var txtUserName: UITextField!

    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var FbHolder: UIView!
    
    var player : Player!
    
    var test: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtPassword.isSecureTextEntry = true
        
        if (FBSDKAccessToken.current() == nil) {
            print("Not loged in..")
        } else {
            print("Loged in...")
        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
       loginButton.center = self.FbHolder.center
        
        loginButton.delegate = self
        
        self.view.addSubview(loginButton)
        
        let x = 80
        let y = 80
        let frame = CGRect(x: x, y: y, width: 30, height: 30)
        let activityIndicatorView = NVActivityIndicatorView(frame: frame, type: .ballTrianglePath, color: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) , padding: CGFloat(0))
        self.view.addSubview(activityIndicatorView)
    }

    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        
        
        if( defaults.object(forKey: "Player_connected") != nil)
        {
            let size = CGSize(width: 30, height: 30)
            self.startAnimating(size, message: "Loading...")
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                NVActivityIndicatorPresenter.sharedInstance.setMessage("Authenticating...")
            }
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                self.stopAnimating()
            }
            self.performSegue(withIdentifier: "playBrain", sender: self)
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //partie fb api
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        
        if error == nil
        {
            print("login completed...")
            self.performSegue(withIdentifier: "playBrain", sender: self)
        }
        else
        {
            print(error.localizedDescription)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Loged out...")
        self.performSegue(withIdentifier: "loggedout", sender: self)
        
        
    }
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Login", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            //print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func Login(_ sender: AnyObject) {
       
        //self.performSegue(withIdentifier: "playBrain", sender: self)
        
        if (self.txtPassword.text?.isEmpty)! || (self.txtUserName.text?.isEmpty)!
            
        {
            self.displayAlertMessage(messageToDisplay: "Please, fill all the fields")
            
        }
        
        var urll:String = "http://127.0.0.1/BrainUp/login.php?identifiant="
        urll += (self.txtUserName.text)!
        urll += "&password="
        urll += (self.txtPassword.text)!
        print(urll)
        let size = CGSize(width: 30, height: 30)
        self.startAnimating(size, message: "Loading...")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            NVActivityIndicatorPresenter.sharedInstance.setMessage("Authenticating...")
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.stopAnimating()
        }
        
        Alamofire.request(urll, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON {
                response in
                switch response.result {
                case .success(let JSON):
                    print("successss")
                    let obj = JSON as! NSDictionary
                    let id = Int(obj.object(forKey: "id") as! String)
                    let fn = obj.object(forKey: "username")as! String
                    let ln = obj.object(forKey: "email")as! String
                    let mail = obj.object(forKey: "password")as! String
                    let adr = obj.object(forKey: "country")as! String
                    let sexe = obj.object(forKey: "gender")as! String
                    let birth = obj.object(forKey: "birthdate")as! String
                    //print(birth)
                    
                    
                    self.player = Player(idP: id, username: fn, mail: ln, password: mail, country: adr, gender: sexe, dateofBirth: birth)
                    print(self.player.description)
                    let encodedPlayer = NSKeyedArchiver.archivedData(withRootObject: self.player)
                    let defaults = UserDefaults.standard
                    defaults.set(encodedPlayer, forKey: "Player_connected")
                    defaults.synchronize()
                    self.performSegue(withIdentifier: "playBrain", sender: self)
                    
                    return
                   
                    
                    
                case .failure(let error):
                    self.displayAlertMessage(messageToDisplay: "Error while processing your request: \(error)")
                    print("Request failed with error: \(error)")
                }
        }
    }
    
    
    @IBAction func bt_Register(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "register", sender: self)
    }
    
    //register
}

       /* else
        {
            var urll:String = "http://localhost/BrainUp/login.php?mail="
            urll += String((self.txtUserName.text)!)
            urll += "&password="
            urll += String((self.txtPassword.text)!)
            
            print(urll)
            
            Alamofire.request(urll, method: .get, parameters: nil, encoding: JSONEncoding.default)
                .responseJSON {
                    response in
                    switch response.result {
                    case .success(let JSON):
                        print("successss")
                        let response = JSON as! NSArray
                        print(response)
                        for item in response {
                            let obj = item as! NSDictionary
                            
                            print("successss looping")
                            
                            if (  Int(obj.object(forKey: "success") as! String)  == 1 )
                            {
                                
                                self.performSegue(withIdentifier: "playBrain", sender: self)
                                return
                            }
                            
                            
                        }
                        
                        
                    case .failure(let error):
                        print("Request failed with error: \(error)")
                    }
            }*/
            

        
        /*
         
         
         */
        


/*

 
        let tempEmail: String = "\(self.txtPassword.text!)"
        let tempApi : String =  "\(self.txtUserName.text!)"
        //var status : String
        var status = String()
       // Alamofire.request(.GET, "http://www.somejsonurl.com/checkEmailExits", parameters: )
 
 
 
             Alamofire.request("http://localhost/BrainUp/login.php", method: .post, parameters: ["identifiant": "\(tempApi)","password" : "\(tempEmail)"], encoding: JSONEncoding.default).responseJSON {
             response in
                //print(response.request)  // original URL request
                //print(response.response) // URL response
              //  print(response.data)     // server data
 
 
 
                print(response.result)   // result of response serialization
 
                switch(response.result) {
                case .success(_):
                    if let JSON = response.result.value as? [[String : AnyObject]]{
                        if JSON.isEmpty == false{
                            //Here the code if the request returns data
                            print("Here the code if the request returns data")
                        }else{
                            //Here I wanted to use the code if null is retrieved
                            print("Here I wanted to use the code if null is retrieved")
                        }
                    }else{
                        print("Cannot be converted")
                        //The JSON cannot be converted
                    }
                    break
                    
                case .failure(_):
                    //Failure 
                    break
                }
                
               /* if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                if let result = response.result.value {
                    let JSON = result as! NSDictionary
                    print(JSON)
                }*/

                
                
        
    }
        }
}

        
      /*  let parameters = [
            "identifiant" : self.txtUserName.text! as String,
            "password" : self.txtPassword.text! as String
        ]
        
        print("Password: ", self.txtPassword.text)
        print("Username: ", self.txtUserName.text)
        
        var statusCode: Int = 0
        
        if self.txtPassword.text == "" || self.txtUserName.text == ""
            
        {
            let Alert = UIAlertController(title: "Alert", message: "Verifier que vos champs sont  remplis ", preferredStyle: UIAlertControllerStyle.alert)
            
            Alert.addAction( UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in }))
            
            self.present(Alert, animated: true, completion: nil)
            
            
          
        }
        
        
        
        
       
        
        
      /*  Alamofire.request("http://localhost/BrainUp/login.php", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
                response in
                statusCode = (response.response?.statusCode)! //Gets HTTP status code, useful for debugging
            
            if let JSON = response.result.value as! [String:AnyObject]!{
                print("JSON response success: ",JSON["success"])
            }
                 
                        
                  
        }*/
        
    
        
      
        
     /*   Alamofire.request("http://localhost/BrainUp/login.php", method: .get, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                //print(response)
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                if let result = response.result.value {
                    let JSON = result as! NSDictionary
                      print("JSON response success: ",JSON["success"])
                    //print(JSON)
                }
                
        }
        
        
        //var status = String()
        
          Alamofire.request("http://localhost/BrainUp/login.php", method: .get, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON {
                response in
                //print(response.request)  // original URL request
                //print(response.response) // URL response
                //print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                let JSON = response.result.value as! [String:AnyObject]!
                
                
                /*if let JSON = response.result.value as! [String:AnyObject]!{
                    print("JSON response success: ",JSON["success"])
                }
                */
                
                
        
                let dict1 = JSON!["Result"]
                print( dict1 )
               // let dict2 = dict1!!["Status"]
                //status = dict2 as! String
                
        }
        
      Alamofire.request("http://localhost/BrainUp/login.php", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
            
            response in
            //print(response.request)  // original URL request
            //print(response.response) // HTTP URL response
            //print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            /*if let JSON = response.result.value {
               print("JSON: \(JSON)")
            }*/
            switch (response.result) {
            case .success( let JSON ) :
                
               print("JSON: \(JSON)")
            case .failure(let error):
                print( error )
            }
        }*/
        
     /*
    //    var statusCode: Int = 0
        Alamofire
            .request("http://localhost/BrainUp/login.php",method: .get, parameters: parameters, encoding: JSONEncoding.default, headers: [:])
            .responseJSON {
                response in
                print(response)
                //to get status code
                if let status = response.response?.statusCode {
                    switch(status){
                    case 201:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                //to get JSON return value
                if let result = response.result.value {
                    let JSON = result as! NSDictionary
                    print(JSON)
                }
            //    response in statusCode = (response.response?.statusCode)! //Gets HTTP status code, useful for debugging
              //  print( response.response?.description)
                            }
        }
 */
 */
*/

