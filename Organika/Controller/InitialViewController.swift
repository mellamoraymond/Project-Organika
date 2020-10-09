//
//  InitialViewController.swift
//  Organika
//
//  Created by Engr. John Raymond Ilagan on 9/22/20.
//  Copyright © 2020 John Raymond Ilagan. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView! {
        willSet {
            newValue.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            newValue.backgroundColor = .none
            newValue.layer.cornerRadius = 20
            newValue.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var signupButton: CustomButton!
    @IBOutlet weak var loginButton: CustomButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9497329593, green: 0.7363067865, blue: 0.7342433333, alpha: 1)
    }
    
    override func viewDidLayoutSubviews() {
        setupView()
        setupAutoLayout()
    }
    //MARK: - Setup View
    
    func setupView() {
        
//        self.containerView.custom()
        
        [signupButton, loginButton].forEach{containerView.addSubview($0)}
        view.addSubview(containerView)
    }
    
    func setupAutoLayout() {
        
        containerView.anchor(
            top: nil,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 20, right: 20)
        )
        
        signupButton.anchor(
            top: containerView.topAnchor, bottom: nil,
            leading: containerView.leadingAnchor,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 50)
        )
        
        loginButton.anchor(
            top: signupButton.bottomAnchor,
            bottom: containerView.bottomAnchor,
            leading: containerView.leadingAnchor,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 20, right: 20),
            size: .init(width: 0, height: 50)
        )
        
    }
    
    
    
}
