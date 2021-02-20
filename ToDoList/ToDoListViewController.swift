//
//  ViewController.swift
//  ToDoList
//
//  Created by Nhan on 2/21/21.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemList = ["aaa","bbb","ccc"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "ToDoListItemCell", for: indexPath)
        cell.textLabel?.text=itemList[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if         tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New To Do List Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title:  "Add Item ", style: .default) { (action) in
            self.itemList.append(textField.text!)
            self.tableView.reloadData()
        }
    
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField=alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true,completion: nil)
    }
}
    

