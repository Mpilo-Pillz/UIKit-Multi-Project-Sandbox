//
//  ViewController.swift
//  Nib-Xib-MVVM-TODO
//
//  Created by Mpilo Pillz on 2023/10/28.
//

import UIKit

class TaskListViewController: UIViewController {
    var viewModel: TaskViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let taskListView = TaskListView()
        taskListView.viewModel = viewModel
        taskListView.breakdownTableView.dataSource = self
        
        taskListView.breakdownTableView.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")

        view.addSubview(taskListView)
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        
        
        let task = viewModel.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
}


