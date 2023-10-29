//
//  AppDelegate.swift
//  Nib-Xib-MVVM-TODO
//
//  Created by Mpilo Pillz on 2023/10/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let taskViewModel = TaskViewModel()
        let taskListViewController = TaskListViewController()
        taskListViewController.viewModel = taskViewModel
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = taskListViewController
        window?.rootViewController = BreakDownTaskListViewController()
        
        return true
    }


}

