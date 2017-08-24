//
//  PendingTasksViewController.swift
//  ToDoSwift
//
//  Created by Aniket Ghode on 24/08/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import UIKit

class PendingTasksViewController: UIViewController {

    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate & ItemManagerSettable)!
    @IBOutlet weak var tableView: UITableView!
    let itemManager = ItemManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        dataProvider.itemManager = itemManager
        dataProvider.isPendingList = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    @IBAction func addNewToDoItem(_ sender: UIBarButtonItem) {
        addNewToDoItem()
    }
    
    func addNewToDoItem() {
        let alertController = UIAlertController(title: "", message: "Enter ToDo Task", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action) in
            let taskNameTextField = alertController.textFields![0] as UITextField
            let title = taskNameTextField.text
            if let title = title, title != "" {
                let item = ToDoItem(title: title)
                self.itemManager.add(item)
                self.tableView.reloadData()
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alertController.addTextField(configurationHandler: { (textField) in
            textField.placeholder = "Enter title for task"
            textField.textAlignment = .center
        })
        present(alertController, animated: true, completion: nil)
        
    }
}
