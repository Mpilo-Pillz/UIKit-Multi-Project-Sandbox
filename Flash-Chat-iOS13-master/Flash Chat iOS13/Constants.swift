//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Mpilo Pillz on 2023/10/21.
//  Copyright © 2023 Angela Yu. All rights reserved.
//
// The static keyword chages it form being a instance property to a value property
// Meaning no need to create an object out of Constance to be able to use the proeprties
import Foundation

struct K {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}


