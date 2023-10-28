//
//  TodoListInteractor.swift
//  VIPER-TODO
//
//  Created by Mpilo Pillz on 2023/10/28.
// The TodoListInteractor is responsible for fetching, creating, updating, and deleting todo items. It communicates with the Presenter to update the View with the fetched data.

import Foundation

class TodoListInteractor {
    var presenter: TodoListPresenter?
    var todoItems: [TodoItem] = [
        TodoItem(title: "Buy groceries", isCompleted: false),
        TodoItem(title: "Walk the dog", isCompleted: true)
    ]

    func getTodoItems() {
        presenter?.todoItemsFetched(todoItems)
    }

    // Add methods for creating, updating and deleting todo items
}
