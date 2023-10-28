//
//  TodoItemCell.swift
//  TODO-MVVM
//
//  Created by Mpilo Pillz on 2023/10/28.
//

import UIKit

class TodoItemCell: UITableViewCell {

    var todoItem: TodoItem? {
            didSet {
                guard let todoItem = todoItem else { return }
                textLabel?.text = todoItem.title
                accessoryType = todoItem.isCompleted ? .checkmark : .none
            }
        }

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func configure(with todoItem: TodoItem) {
            self.todoItem = todoItem
        }
}
