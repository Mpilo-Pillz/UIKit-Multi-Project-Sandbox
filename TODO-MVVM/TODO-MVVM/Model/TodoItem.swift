//
//  TodoItem.swift
//  TODO-MVVM
//
//  Created by Mpilo Pillz on 2023/10/28.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}

