//
//  File.swift
//  Organika
//
//  Created by Engr. John Raymond Ilagan on 9/20/20.
//  Copyright © 2020 John Raymond Ilagan. All rights reserved.
//

import Foundation
import RealmSwift

class UserModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
