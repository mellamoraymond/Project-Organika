//
//  Button.swift
//  Organika
//
//  Created by Engr. John Raymond Ilagan on 10/8/20.
//  Copyright © 2020 John Raymond Ilagan. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    // Programmatic UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    //Storyboard purposes
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    func setupButton() {
      
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.cornerRadius = 15
        clipsToBounds = true
        
    }
}
