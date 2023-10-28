//
//  Item.swift
//  Todoey
//
//  Created by Mpilo Pillz on 2023/10/27.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
// Encodable only accepts standard data times not custom ones, so your properties mut be standar typed eg Int, STring, Dictionary etc
class Item: Encodable, Decodable {
    var title: String = ""
    var done: Bool = false
}
