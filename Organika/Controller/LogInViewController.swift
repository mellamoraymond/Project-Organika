//
//  RegisterViewController.swift
//  Organika
//
//  Created by Engr. John Raymond Ilagan on 9/20/20.
//  Copyright © 2020 John Raymond Ilagan. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    //MARK: - IB Outlets
    
    @IBOutlet weak var containerView: UIView! {
        willSet {
            newValue.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.9647058824, blue: 0.7725490196, alpha: 1)
            newValue.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var emailTextField: UITextField!  {
        willSet {
            newValue.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            newValue.placeholder = "Email"
            newValue.borderStyle = .roundedRect
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        willSet {
            newValue.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            newValue.placeholder = "Email"
            newValue.borderStyle = .roundedRect
        }
    }
    
    @IBOutlet weak var loginButton: CustomButton!
    
    //MARK: - Global Variables
    
    private let db = Firestore.firestore()
    private var farmer = Farmer(email: "")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        setupView()
        setupAutoLayout()
    }
    
    //MARK: - Setup View
    
    func setupView() {
        
        title = K.appName
        
        
        [emailTextField, passwordTextField, loginButton].forEach {containerView.addSubview($0)}
        view.addSubview(containerView)
    }
    
    
    func setupAutoLayout() {
        
        containerView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            bottom: nil,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20)
        )
        
        emailTextField.anchor(
            top: containerView.topAnchor,
            bottom: nil,
            leading: containerView.leadingAnchor,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 50)
        )
        
        passwordTextField.anchor(
            top: emailTextField.bottomAnchor,
            bottom: nil,
            leading: containerView.leadingAnchor,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 50)
        )
        
        loginButton.anchor(
            top: passwordTextField.bottomAnchor,
            bottom: containerView.bottomAnchor,
            leading: containerView.leadingAnchor,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 20, right: 20),
            size: .init(width: 0, height: 50)
        )
    }
    
    //MARK: - Networking
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
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
                    self.performSegue(withIdentifier: K.Segue.loginSegue, sender: self)
                }
            }
        }
    }
    
}
