//
//  AuthenticationVM.swift
//  Design
//
//  Created by kasper on 7/28/20.
//  Copyright © 2020 com.Mahmoud.Abdul-Wahab.NewDesign25. All rights reserved.
//

import Foundation

class AuthenticationVM: NSObject {
    var user : User!
    var email : String{
        return user.email
    }
    var password : String {
        return user.password
    }
    typealias authenticationCallBack = (_ status : Bool , _ message : String)->Void
    
    var loginCallBack : authenticationCallBack?
    
    func authenticateUser(with email : String , password : String )  {
       
            if email.count != 0 {
                   if password.count != 0 {
                    self.verifyUserWith(email,andpassword: password)
                   }else{
                       // password is empty
                       self.loginCallBack?(false , "empty password ....")
                      }
                  }else{
                      //email is empty
                       self.loginCallBack?(false , "empty email ....")

                  }
        
      
    }
    
                                                                                                                                                                                                                   
    fileprivate func verifyUserWith(_ email : String , andpassword password : String){
        
       if email == "test" && password == "123"
       {
        user = User(email: email, password: password)
        self.loginCallBack?(true , "user successfully authenticated ^_^")
       }else{
         // invalid credentials
         self.loginCallBack?(false , "invalid credentials ")

        }
    }
    
             // take a closure as a parameter
    func loginCompletionHandler(callBack : @escaping authenticationCallBack) {
        
         self.loginCallBack = callBack
    }
}
