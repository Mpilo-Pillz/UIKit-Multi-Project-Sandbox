//
//  TaskListView.swift
//  Nib-Xib-MVVM-TODO
//
//  Created by Mpilo Pillz on 2023/10/29.
//

import UIKit

class TaskListView: UIView {

    @IBOutlet var contentView: TaskListView!
    @IBOutlet weak var tableView: UITableView!
    var viewModel: TaskViewModel!

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            commonInit()
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }

//        private func commonInit() {
//            let nib = UINib(nibName: "TaskListView", bundle: nil)
//            nib.instantiate(withOwner: self, options: nil)
//            addSubview(tableView)
//            tableView.frame = bounds
//            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TaskCell")
//        }
    
    private func commonInit() {
        let bundle = Bundle(for: TaskListView.self)
//            Move to constaints
        bundle.loadNibNamed("TaskListView", owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = .systemMint
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}
