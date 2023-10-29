//
//  BreakDownTaskListViewController.swift
//  Nib-Xib-MVVM-TODO
//
//  Created by Mpilo Pillz on 2023/10/29.
//

import UIKit

class BreakDownTaskListViewController: UIViewController {
    var viewModel: TaskViewModel!
    
    let names = ["Mpi", "Thul", "Fika"]
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        
        setUpTableViewContraints()
        
    }

}

// MARK - Set up and pin table view to view controller
extension BreakDownTaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    

}




// MARK - Set up and pin table view to view controller
extension BreakDownTaskListViewController {
    func setUpTableViewContraints() {
//        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    
        
    }
    
}



