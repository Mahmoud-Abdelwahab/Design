//
//  MVVMDemo.swift
//  Design
//
//  Created by kasper on 7/28/20.
//  Copyright © 2020 com.Mahmoud.Abdul-Wahab.NewDesign25. All rights reserved.
//

import UIKit


//MARK:- MVVM
// M -> MODEL
//V -> VIEWCONTROLLER WHICH REPRESENT UI AND DATA TO USER
//VM -> VIEW MODEL : I ACTS AS A BRIDG BETWEEN MODEL AND AVIEW AND CONTAINS BUSINESS LOGIC FOR THE VIEW 
class MVVMDemo: UIViewController {
  
    var authenticationVM  = AuthenticationVM()
   
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
 self.resultText.text = " Result "
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        guard let email = emailText.text , !email.isEmpty ,  let password = passwordText.text , !password.isEmpty else {
            return
         }
       

        authenticationVM.loginCompletionHandler { [weak self](status, message) in
            guard let self = self else{ return }
            if status {
                // loged in successfully
                print("success")
                self.resultText.text = " successfully login : ---> Your Email Is :\(self.authenticationVM.email) : and your password is : \(self.authenticationVM.password)"
                
            }else{
                // somthing Wrong
                 self.resultText.text = message
            }
        }
        
        
        authenticationVM.authenticateUser(with: email, password: password)
        
       }

}
