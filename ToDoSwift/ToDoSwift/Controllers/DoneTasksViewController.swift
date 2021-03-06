//
//  DoneTasksViewController.swift
//  ToDoSwift
//
//  Created by Aniket Ghode on 24/08/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import UIKit

class DoneTasksViewController: UIViewController {

    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate & ItemManagerSettable)!
    @IBOutlet weak var tableView: UITableView!
    let itemManager = ItemManager.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = Constants.themeColor
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        tabBarController?.tabBar.barTintColor = Constants.themeColor
        tabBarController?.tabBar.tintColor = UIColor.white
        
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        dataProvider.itemManager = itemManager
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}
