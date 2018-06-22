//
//  ViewController.swift
//  Todoey
//
//  Created by praveen thati on 6/22/18.
//  Copyright © 2018 state of delaware. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Go to Gym at 6 PM", "Call to home", "Study in the evening"]
    
    let defaults = UserDefaults.standard
    var cell: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = UserDefaults.standard.array(forKey: "TodoListArray") as? [String] {
            itemArray = item
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell")
        let selectedItem = itemArray[indexPath.row]
        cell?.textLabel?.text = selectedItem
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cellIndex = tableView.cellForRow(at: indexPath)
        cellIndex?.textLabel?.textColor = UIColor.black
        if cellIndex?.accessoryType == .checkmark {
            cellIndex?.accessoryType = .none
        } else {
            cellIndex?.accessoryType = .checkmark 
        }
        
        
    
    }
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen once the user clicks the add Item button on our UIAlert
            self.itemArray.append( textField.text!)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
           
        }
            alert.addAction(action)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
        }
            
            present(alert, animated: true, completion: nil)
            
        
    }
    

}

