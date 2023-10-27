//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

//    var itemArray = ["Finish this chapter", "Re do Tipsy", "Build my app", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "y", "z", "x", "c", "v", "m"]
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Finish this chapter"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Re do Tipsy"
        newItem2.done = false
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Build my app"
        itemArray.append(newItem3)
        
    
       
        
        
        
        // get the todos form info plsist local storage saved form last session
//        itemArray = defaults.array(forKey: "TodoListArray") as! [String]
//        if let items  = defaults.array(forKey: "TodoListArray") as? [String] {
//            itemArray = items
//        }
        // Do any additional setup after loading the view.
    }
    
    // MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cell for row at index path called")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
//        cell.textLabel?.text = itemArray[indexPath.row]
//        cell.textLabel?.text = itemArray[indexPath.row].title
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
       
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
    }
    
    // MARK - Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row] )
        
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//            itemArray[indexPath.row].done = false
//        }
        
        tableView.reloadData() // call the data source methods again to reload the data
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            // Wha happens once user clicks the add Item on out UI Alert
            
            let newItem = Item() // now an object
            newItem.title = textField.text!
//            self.itemArray.append(textField.text!)
            
            // this is gonna be saved in the info plist
            self.defaults.set(self.itemArray, forKey: "TodoListArray") // save to local storage
            
            self.tableView.reloadData() // reload the data so the the table refreshes. Kind of like angulars change detection
            // force unwrap beaucse the value of the textfield will never be nil it woll be empty string
        }
        
        alert.addTextField { alertTexField in
            alertTexField.placeholder = "Create new item"
            textField = alertTexField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}



