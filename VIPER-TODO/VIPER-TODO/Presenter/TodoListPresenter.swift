//
//  TodoListPresenter.swift
//  VIPER-TODO
//
//  Created by Mpilo Pillz on 2023/10/28.
// The TodoListPresenter fetches the data from the Interactor, handles the logic of how the data will be displayed in the View, and relays the user input from the View to the Interactor.

import Foundation
class TodoListPresenter {
    var interactor: TodoListInteractor?
    var view: TodoListView?

    func viewWillAppear() {
        interactor?.getTodoItems()
    }

    func todoItemsFetched(_ todoItems: [TodoItem]) {
        view?.displayTodoItems(todoItems)
    }

    // Add methods for handling user interactions like selecting, creating, updating, and deleting todo items
}
