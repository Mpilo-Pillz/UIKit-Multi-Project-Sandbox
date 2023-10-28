//
//  TaskViewModel.swift
//  Nib-Xib-MVVM-TODO
//
//  Created by Mpilo Pillz on 2023/10/28.
//

import Foundation

class TaskViewModel {
    var tasks: [Task] = []
    
    init() {
        addTask(title: "Sample Task")
    }

    func addTask(title: String) {
        let task = Task(title: title, completed: false)
        tasks.append(task)
    }
}
