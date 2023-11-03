//
//  Data.swift
//  Todoey
//
//  Created by Mpilo Pillz on 2023/11/03.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = "" // use dynamic dipatch over static dispatch
    // means listen for changes on the properties and update db according
    @objc dynamic var age: Int = 0
}
