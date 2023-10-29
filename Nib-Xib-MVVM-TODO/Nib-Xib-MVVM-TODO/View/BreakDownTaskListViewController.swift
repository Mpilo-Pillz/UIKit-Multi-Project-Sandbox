//
//  BreakDownTaskListViewController.swift
//  Nib-Xib-MVVM-TODO
//
//  Created by Mpilo Pillz on 2023/10/29.
//

import UIKit

class BreakDownTaskListViewController: UIViewController {
    var viewModel: TaskViewModel! = TaskViewModel()
    
    let names = ["Oilz", "Pilz", "OilerPlate", ]
    var breakdownTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        
        setUpTableViewContraints()
        setUpTableHEaderView()
        
    }

}

// MARK - Set up and pin table view to view controller
extension BreakDownTaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

//        return names.count
        return viewModel.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
//        cell.textLabel?.text = names[indexPath.row]
//
//        return cell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        
        let task = viewModel.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        return cell
    }
    

}




// MARK - Set up and pin table view to view controller
extension BreakDownTaskListViewController {
    func setUpTableViewContraints() {
//        tableView.delegate = self
        breakdownTableView.dataSource = self
        
        breakdownTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(breakdownTableView)
        
        NSLayoutConstraint.activate([
            breakdownTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            breakdownTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            breakdownTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            breakdownTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    
        
    }
    
}

extension BreakDownTaskListViewController {
    private func setUpTableHEaderView() {
        let header = BreakdownTaskListView(frame: .zero)
            
            var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            size.width = UIScreen.main.bounds.width
            header.frame.size = size
            
            breakdownTableView.tableHeaderView = header
    }
}



