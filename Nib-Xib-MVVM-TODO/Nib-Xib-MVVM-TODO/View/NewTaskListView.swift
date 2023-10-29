//
//  NewTaskListView.swift
//  Nib-Xib-MVVM-TODO
//
//  Created by Mpilo Pillz on 2023/10/29.
//

import UIKit

class NewTaskListView: UIView {

    @IBOutlet var newContentView: UIView!
    var manualTableView = UITableView()
    var viewModel: TaskViewModel! = TaskViewModel()

    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        override var intrinsicContentSize: CGSize {
            return CGSize(width: UIView.noIntrinsicMetric, height: 144)
        }
        
        private func commonInit() {
            let bundle = Bundle(for: NewTaskListView.self)
//            Move to constaints
            bundle.loadNibNamed("NewTaskListView", owner: self, options: nil)
            addSubview(newContentView)
            newContentView.backgroundColor = .cyan
            
            newContentView.translatesAutoresizingMaskIntoConstraints = false
            newContentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            newContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            newContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            newContentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }

}
