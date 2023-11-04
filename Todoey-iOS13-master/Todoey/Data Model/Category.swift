//
//  Category.swift
//  Todoey
//
//  Created by Mpilo Pillz on 2023/11/05.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    // use dynamic dipatch over static dispatch
    // means listen for changes on the properties and update db according
}
