//
//  ViewController.swift
//  TODO-MVVM
//
//  Created by Mpilo Pillz on 2023/10/28.
// Now, we need to create the TodoListView. This view will display a list of todo items, a checkmark for completed tasks, and a "+" button to add new tasks.

import UIKit

class ViewController: UIViewController {

    private var viewModel = TodoListViewModel()
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableView.register(TodoItemCell.self, forCellReuseIdentifier: "TodoItemCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.todoItems.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath) as! TodoItemCell
            let todoItem = viewModel.todoItems[indexPath.row]
            cell.configure(with: todoItem)
            return cell
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Handle selection of todo item
        }
    
    // Implement UITableViewDataSource and UITableViewDelegate methods
}

