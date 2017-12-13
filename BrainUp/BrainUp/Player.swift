//
//  Player.swift
//  BrainUp
//
//  Created by MACBOOKPRO on 25/04/2017.
//  Copyright © 2017 ESPRIT. All rights reserved.
//

import Foundation

class Player :  NSObject, NSCoding  {
    
    var id: Int?
    var UserName: String?
    var Email: String?
    var Password: String?
    var Country: String?
    var Gender: String?
    var DateOfBirth: String?
    var idMemory : Int?
    var idQuiz : Int?
    
    
    
     init?(idP: Int? ,username: String?, mail: String?,password: String?, country:String?, gender: String?, dateofBirth: String?) {
        self.id = idP
        self.UserName = username
        self.Email = mail
        self.Password = password
        self.Country = country
        self.Gender = gender
        self.DateOfBirth = dateofBirth
        
    }
    
    override var  description : String {
        return " player id: \(self.id)" +
            "UserName: \(self.UserName)" +
            "Country: \(self.Country)\n" +
            "Email: \(self.Email)\n" +
            "Password: \(self.Password)\n" +
            "Date of birth : \(self.DateOfBirth)\n" +
            "Gender: \(self.Gender)\n"
        
        
    }
    required init(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.UserName = decoder.decodeObject(forKey: "UserName") as? String
        self.Password = decoder.decodeObject(forKey: "Password") as? String
        self.Email = decoder.decodeObject(forKey: "Email") as? String
        self.Country = decoder.decodeObject(forKey: "Country") as? String
        self.Gender = decoder.decodeObject(forKey: "Gender") as? String
        self.DateOfBirth = decoder.decodeObject(forKey: "DateOfBirth") as! String?
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id!, forKey: "id")
        aCoder.encode(self.UserName , forKey: "UserName")
        aCoder.encode(self.Email, forKey: "Email")
        aCoder.encode(self.Password, forKey: "Password")
        aCoder.encode(self.Country, forKey: "Country")
        aCoder.encode(self.Gender, forKey: "Gender")
        aCoder.encode(self.DateOfBirth!, forKey: "DateOfBirth")
    }
}
