//
//  TodoListViewModel.swift
//  TODO-MVVM
//
//  Created by Mpilo Pillz on 2023/10/28.
//

import Foundation
import Combine

class TodoListViewModel: ObservableObject {
    @Published var todoItems: [TodoItem] = [
        TodoItem(title: "Buy groceries", isCompleted: false),
        TodoItem(title: "Walk the dog", isCompleted: true)
    ]
}
