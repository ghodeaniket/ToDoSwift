//
//  PendingTasksDataProvider.swift
//  ToDoSwift
//
//  Created by Aniket Ghode on 24/08/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import UIKit

@objc protocol ItemManagerSettable {
    var itemManager: ItemManager? { get set }
    var isPendingList: Bool { get set}
}

class TasksDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate, ItemManagerSettable {
    var itemManager: ItemManager?
    var isPendingList: Bool = false
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        guard let itemManager = itemManager else { return 0 }
        
        let numberOfRows: Int

        if isPendingList {
            numberOfRows = itemManager.toDoCount
        } else{
            numberOfRows = itemManager.doneCount
        }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ItemCell",
            for: indexPath) as! ItemCell
        
        guard let itemManager = itemManager else { fatalError() }
        
        let item: ToDoItem
        var checked = false
        if isPendingList {
            item = itemManager.item(at: indexPath.row)
        } else {
            item = itemManager.doneItem(at: indexPath.row)
            checked = true
        }
        
        cell.configCell(with: item, checked: checked)
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        titleForDeleteConfirmationButtonForRowAt indexPath:
        IndexPath) -> String? {
        
        let buttonTitle = "Delete"
        
        return buttonTitle
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath) {
        
        guard let itemManager = itemManager else { fatalError() }
        
        if isPendingList {
            itemManager.remove(at: indexPath.row)
        } else {
            itemManager.removeDoneItem(at: indexPath.row)
        }
        
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let itemManager = itemManager else { fatalError() }
        
        if isPendingList {
            itemManager.checkItem(at: indexPath.row)
        } else {
            itemManager.uncheckItem(at: indexPath.row)
        }
        tableView.reloadData()
    }

}
