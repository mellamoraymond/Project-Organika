//
//  RegisterViewController.swift
//  Organika
//
//  Created by Engr. John Raymond Ilagan on 9/20/20.
//  Copyright © 2020 John Raymond Ilagan. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var emailTextField: String! = "1@2.com"
    var passwordTextfield: String! = "123456"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        auth()
        
    }
    
    func auth() {
        
        if let email = emailTextField, let password = passwordTextfield {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    print("Registration successful")
                    // Navigate to ChatViewController
                    // self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
                
            }
        }
    }
 
}
