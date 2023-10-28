//
//  TodoItem.swift
//  TODO-MVVM
//
//  Created by Mpilo Pillz on 2023/10/28.
// First, we need to create a simple TodoItem model. This struct will represent a single todo item, with a title and a flag indicating whether it’s completed.

import Foundation

struct TodoItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}

