//
//  TaskList.swift
//  Nib-Xib-MVVM-TODO
//
//  Created by Mpilo Pillz on 2023/10/29.
//

import UIKit

class BreakdownTaskListView: UIView {

    @IBOutlet var contentView: UIView!
//    TODOLIST
    var viewModel: TaskViewModel!
    
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
            let bundle = Bundle(for: BreakdownTaskListView.self)
//            Move to constaints
            bundle.loadNibNamed("BreakdownTaskListView", owner: self, options: nil)
            addSubview(contentView)
            contentView.backgroundColor = .cyan
            
            contentView.translatesAutoresizingMaskIntoConstraints = false
            contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        }

}
