//
//  NewTaskListViewController.swift
//  Nib-Xib-MVVM-TODO
//
//  Created by Mpilo Pillz on 2023/10/29.
//

import UIKit

class NewTaskListViewController: UIViewController {

    var viewModel: TaskViewModel!
    var manualTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let newTaskListView = NewTaskListView()
        newTaskListView.viewModel = viewModel
        newTaskListView.manualTableView.dataSource = self
        
        newTaskListView.manualTableView.register(TaskCell.self, forCellReuseIdentifier: "TaskCell")
        // Do any additional setup after loading the view.
        
        setUpTableHEaderView()
        setUpTableViewContraints()    
    }
    

    

}

extension NewTaskListViewController: UITableViewDataSource {
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

extension NewTaskListViewController {
    func setUpTableViewContraints() {
//        tableView.delegate = self
        manualTableView.dataSource = self
        
        manualTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(manualTableView)
        
        NSLayoutConstraint.activate([
            manualTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            manualTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            manualTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            manualTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    
        
    }
}

extension NewTaskListViewController {
    private func setUpTableHEaderView() {
        let header = BreakdownTaskListView(frame: .zero)
            
            var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            size.width = UIScreen.main.bounds.width
            header.frame.size = size
            
            manualTableView.tableHeaderView = header
    }
}
