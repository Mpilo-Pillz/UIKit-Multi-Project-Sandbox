//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    //    var itemArray = ["Finish this chapter", "Re do Tipsy", "Build my app", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "y", "z", "x", "c", "v", "m"]
    var itemArray = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Itemss.plist") // usrDomainMask is home dir
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        // searchBar.delegate = self we set it using story boards by poiting to that square view controller
        
        loadItems()
        
    }
    
    // MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cell for row at index path called")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
        
    }
    
    // MARK - Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row] )
        
        //        itemArray[indexPath.row].setValue("Completed", forKey: "Title")
        
        //        context.delete(itemArray[indexPath.row]) // first delete from db
        //        itemArray.remove(at: indexPath.row) // then delete form array else index will be non existant
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            // Wha happens once user clicks the add Item on out UI Alert
            
            // problem here is we are trying to access persistent container that is local to App Delegate Class
            // AppDelegate.persistentContainer wont work cos AppDelegate is a class and not the object of the Class
            // We need to get the object created from App Delegate
            // We use a singleton to access it and delegate prop litereally is the APPdelegate
            // Then Down cast it as APP delegate
            
            let newItem = Item(context: self.context) // now an object
            newItem.title = textField.text!
            newItem.done = false // Had to make it optional cause could not migrate data
            self.itemArray.append(newItem)
            
            self.saveItems()
            
        }
        
        alert.addTextField { alertTexField in
            alertTexField.placeholder = "Create new item"
            textField = alertTexField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: Manual Manipulation Models
    
    func saveItems() {
        
        
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        self.tableView.reloadData() // reload the data so the the table refreshes. Kind of like angulars change detection
        // force unwrap beaucse the value of the textfield will never be nil it woll be empty string
    }
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest()) {
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        
        //        if let data = try? Data(contentsOf: dataFilePath!) {
        //            let decoder = PropertyListDecoder()
        //            // xcode not able to infer the array data type items
        //            do {
        //                itemArray = try decoder.decode([Item].self, from: data)
        //            } catch {
        //                print("Error decoding items \(itemArray)")
        //            }
        //        }
    }
    
    
    
    
}

//MARK: - Search bar methods

extension TodoListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        //        added the [cd] to ingnore diacritics eg Umlout and Circomflex and gave
        request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        loadItems(with: request) // dont need the argument cuas of defualt value tem.fetchRequest()
        
        tableView.reloadData()
        
    }
}





