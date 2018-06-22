//
//  ViewController.swift
//  Todoey
//
//  Created by praveen thati on 6/22/18.
//  Copyright © 2018 state of delaware. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Go to Gym at 6 PM", "Call to home", "Study in the evening"]
    var cell: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
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


}

