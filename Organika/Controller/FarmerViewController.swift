//
//  ViewController.swift
//  Organika
//
//  Created by Engr. John Raymond Ilagan on 9/20/20.
//  Copyright © 2020 John Raymond Ilagan. All rights reserved.
//

import UIKit
import Firebase

class FarmerViewController: UIViewController {
    
    //MARK: - IB Outlets
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    //MARK: - Global Variables
    
    private let db = Firestore.firestore()
    private var handle: AuthStateDidChangeListenerHandle?
    private var email: String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = K.setupTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
            if let email = user?.email {
                self.email = email
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(true)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
        let dataDict =  ["firstName":   firstNameTextField.text!,
                         "lastName":    lastNameTextField.text!,
                         "age":         Int(ageTextField.text!) ?? 0,
                         "email":       email
            ] as [String : Any]
        
        let docRef = db.collection("farmer").document(email).collection("collection-01").document("profile")
        
        docRef.setData(dataDict) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written. Email: \(self.email)")
            }
        }
    }
    
}
