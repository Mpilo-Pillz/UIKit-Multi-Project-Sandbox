//
//  TodoItem.swift
//  VIPER-TODO
//
//  Created by Mpilo Pillz on 2023/10/28.
// The TodoItem struct remains the same as in the MVVM approach, it represents a single todo item.

import Foundation

struct TodoItem {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}
