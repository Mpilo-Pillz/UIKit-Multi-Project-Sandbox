//
//  TaskListView.swift
//  Nib-Xib-MVVM-TODO
//
//  Created by Mpilo Pillz on 2023/10/28.
//

import UIKit

class TaskListView: UIView {
    
 
    var viewModel: TaskViewModel!

    required init?(coder: NSCoder) {
           super.init(coder: coder)
           commonInit()
       }
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           commonInit()
       }
    
    private func commonInit() {
           let nib = UINib(nibName: "TaskListView", bundle: nil)
           nib.instantiate(withOwner: self, options: nil)
           addSubview(tableView)
           tableView.frame = bounds
           tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TaskCell")
       }

}
