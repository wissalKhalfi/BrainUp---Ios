//
//  RegisterViewController.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 25/04/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//

import UIKit
import PasswordTextField
import Alamofire
import NVActivityIndicatorView

class RegisterViewController: UIViewController, UITextFieldDelegate , UIPickerViewDataSource, UIPickerViewDelegate ,  NVActivityIndicatorViewable {
    
    

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var ConfirmPassword: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var dateOfbirth: UITextField!
    var pickOption = ["Female", "Male"]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let pickerView = UIPickerView()
        pickerView.delegate = self
        gender.inputView = pickerView
        dateOfbirth.delegate = self
        username.delegate = self
        email.delegate = self
        password.delegate = self
        password.isSecureTextEntry = true
        ConfirmPassword.delegate = self
        ConfirmPassword.isSecureTextEntry = true
        country.delegate = self
        gender.delegate = self
        let x = 80
        let y = 80
        let frame = CGRect(x: x, y: y, width: 30, height: 30)
        let activityIndicatorView = NVActivityIndicatorView(frame: frame, type: .ballTrianglePath, color: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1) , padding: CGFloat(0))
        self.view.addSubview(activityIndicatorView)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 
    
    @IBAction func BackButton(_ sender: AnyObject) {
     dismiss(animated: true, completion: nil)   
    }
    @IBAction func DateofBirthInput(_ sender: AnyObject) {
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        dateOfbirth.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .valueChanged)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateOfbirth.text = dateFormatter.string(from: sender.date)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func bt_register(_ sender: AnyObject) {
        
        let mail = email.text! as String
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: mail)
        let pass = password.text! as String
        let ispasswordValid = isPasswordValid(PasswordString: pass)
        let confpass = ConfirmPassword.text! as String
        let match = PasswordsMatch(PasswordStr: pass, PasswordConfirmStr: confpass)
        
        if  (email.text?.isEmpty)! || (username.text?.isEmpty)! || (password.text?.isEmpty)! || (ConfirmPassword.text?.isEmpty)! || (country.text?.isEmpty)! || (gender.text?.isEmpty)! || (dateOfbirth.text?.isEmpty)! {
            
           displayAlertMessage(messageToDisplay: "Please fill all the fields")
            
        } else if !isEmailAddressValid {
            displayAlertMessage(messageToDisplay: "Email address is not valid")
        } else if !ispasswordValid {
             displayAlertMessage(messageToDisplay: "Password is not valid, must contain 8 characters")
        } else if !match {
            displayAlertMessage(messageToDisplay: "Passwords does not match")
        }else  {
             self.signin()
             //displayAlertMessage(messageToDisplay: "Great")
        }
    }
    
    func signin(){
        
        /*let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        
        // Position Activity Indicator in the center of the main view
        myActivityIndicator.center = view.center
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = false
        
        // Start Activity Indicator
        myActivityIndicator.startAnimating()
        
        // Call stopAnimating() when need to stop activity indicator
        //myActivityIndicator.stopAnimating()
        
        
        view.addSubview(myActivityIndicator)*/
        let size = CGSize(width: 30, height: 30)
        self.startAnimating(size, message: "Loading...")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            NVActivityIndicatorPresenter.sharedInstance.setMessage("Authenticating...")
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.stopAnimating()
        }
        
        let mail = email.text! as String
        let pass = password.text! as String
        let userName = username.text! as String
        let Country = country.text! as String
        let Gender = gender.text! as String
        let birthdate = dateOfbirth.text! as String
        //let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "dd MMM yyyy"
        //dateFormatter.locale = Locale.init(identifier: "en_GB")
        //let dateObj = dateFormatter.date(from: birthdate)
        //dateFormatter.dateFormat = "MM-dd-yyyy"
        //print("Birthdate as date: \(dateFormatter.string(from: dateObj!))")
        
        let urll:String = "http://127.0.0.1/BrainUp/register.php"
        
        let param : Parameters =  [ "username" : userName, "email" : mail, "password": pass, "country" : Country, "gender" : Gender, "birthdate" : birthdate ]
        print(urll)
        
        Alamofire.request(urll, method: .get, parameters: param).responseJSON {
                response in
                switch response.result {
                case .success(let JSON):
                    print("successss")
                    let response = JSON as! NSDictionary
                    
                    if (  Int(response.object(forKey: "success") as! NSNumber )  == 1 )
                    {
                        //myActivityIndicator.stopAnimating()
                        self.performSegue(withIdentifier: "successRegister", sender: self)
                        return
                    }
                   
                    
                    
                case .failure(let error):
                     //myActivityIndicator.stopAnimating()
                     self.displayAlertMessage(messageToDisplay: "Error while processing your request: \(error)")
                     print("Request failed with error: \(error)")
                }
        }
       

        
    }
    func PasswordsMatch(PasswordStr: String, PasswordConfirmStr: String) -> Bool {
        
        
        var returnValue = true
        
        if PasswordStr != PasswordConfirmStr {
            returnValue = false
        }
        
        return  returnValue
    }
    
    
    func isPasswordValid(PasswordString: String) -> Bool {
        
        
        var returnValue = true
        let passwordRegEx = "[A-Za-z0-9.-]{8}"
        do {
            let regex = try NSRegularExpression(pattern: passwordRegEx)
            let nsString = PasswordString as NSString
            let results = regex.matches(in: PasswordString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Register", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
   
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gender.text = pickOption[row]
    }

}
