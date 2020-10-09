//
//  Core.swift
//  Organika
//
//  Created by Engr. John Raymond Ilagan on 10/9/20.
//  Copyright © 2020 John Raymond Ilagan. All rights reserved.
//

import UIKit

class Core {
    
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
