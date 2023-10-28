//
//  ViewController.swift
//  VIPER-TODO
//
//  Created by Mpilo Pillz on 2023/10/28.
// The TodoListView displays the user interface as told by the Presenter. It keeps a reference to the Presenter to relay user input and view lifecycle events to the Presenter to react.

import UIKit

class TodoListView: UIViewController {
    var presenter: TodoListPresenter?
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            presenter?.viewWillAppear()
        }
    
    private func setupTableView() {
            // Setup the table view
        }
    
    func displayTodoItems(_ todoItems: [TodoItem]) {
            // Update the table view with the fetched todo items
        }

        // Add methods for handling user interactions like selecting a todo item, adding a new todo item, etc.


}

