//
//  SignupViewController.swift
//  Organika
//
//  Created by Engr. John Raymond Ilagan on 9/21/20.
//  Copyright © 2020 John Raymond Ilagan. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    //MARK: - IB Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = K.appName
        setupView()
        setUpAutoLayout()
    }
    
    //MARK: - UI View
    
    func setupView() {
        
        containerView.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.9647058824, blue: 0.7725490196, alpha: 1)
        containerView.layer.cornerRadius = 5
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        signupButton.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.768627451, blue: 0.631372549, alpha: 1)
        signupButton.setTitle("Login", for: .normal)
        signupButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        signupButton.layer.cornerRadius = 5
        signupButton.clipsToBounds = true
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setUpAutoLayout() {
          containerView.addSubview(emailTextField)
          containerView.addSubview(passwordTextField)
          containerView.addSubview(signupButton)
          view.addSubview(containerView)
          
          containerView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
          containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
          containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
          containerView.heightAnchor.constraint(equalToConstant: 275).isActive = true
          
          emailTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40).isActive = true
          emailTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
          emailTextField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
          emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
          
          passwordTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
          passwordTextField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
          passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
          passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
          
          signupButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
          signupButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
          signupButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20).isActive = true
          signupButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
      }
    
    //MARK: - Networking
      
      @IBAction func signupPressed(_ sender: UIButton) {
          
          if let email = emailTextField.text, let password = passwordTextField.text {
              
              Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                  
                  if let e = error {
                      print(e.localizedDescription)
                      let alert = UIAlertController(title: "Try Again",
                                                    message: e.localizedDescription,
                                                    preferredStyle: .alert)
                      alert.addAction(UIAlertAction(title: "Ok",
                                                    style: .default,
                                                    handler: nil))
                      self.present(alert, animated: true, completion: nil)
                      
                  } else {
                      // Navigate to FarmerViewController
                      self.performSegue(withIdentifier: K.Segue.signupSegue, sender: self)
                  }
              }
          }
      }
}
