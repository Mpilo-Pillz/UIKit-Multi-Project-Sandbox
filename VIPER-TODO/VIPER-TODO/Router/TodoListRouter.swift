//
//  TodoListRouter.swift
//  VIPER-TODO
//
//  Created by Mpilo Pillz on 2023/10/28.
// The Router is responsible for the navigation logic of the app. It creates and sets up the modules (View, Interactor, Presenter) and handles the navigation between screens.

import Foundation
class TodoListRouter {
    static func createTodoListModule() -> TodoListView {
        let view = TodoListView()
        let presenter = TodoListPresenter()
        let interactor = TodoListInteractor()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
