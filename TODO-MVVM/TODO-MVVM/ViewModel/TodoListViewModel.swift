//
//  TodoListViewModel.swift
//  TODO-MVVM
//
//  Created by Mpilo Pillz on 2023/10/28.
//Next, we'll create a TodoListViewModel to handle the business logic. This ViewModel is an ObservableObject that holds an array of TodoItems. This array will be our source of truth for displaying and managing todo items.

import Foundation
import Combine

class TodoListViewModel: ObservableObject {
    @Published var todoItems: [TodoItem] = [
        TodoItem(title: "Buy groceries", isCompleted: false),
        TodoItem(title: "Walk the dog", isCompleted: true)
    ]
}
