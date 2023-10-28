//
//  AppDelegate.swift
//  VIPER-TODO
//
//  Created by Mpilo Pillz on 2023/10/28.
// In the AppDelegate, we set up the TodoListModule as the root view controller of the window.

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


// TODO the items are not showing fix
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            let todoListView = TodoListRouter.createTodoListModule()
            window?.rootViewController = todoListView
            window?.makeKeyAndVisible()
            return true
        }


}

