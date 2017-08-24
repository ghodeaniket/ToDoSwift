//
//  DoneTasksDataProvider.swift
//  ToDoSwift
//
//  Created by Aniket Ghode on 24/08/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import UIKit

@objc protocol ItemManagerSettable {
    var itemManager: ItemManager? { get set }
}

class DoneTasksDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate, ItemManagerSettable {
    var itemManager: ItemManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        guard let itemManager = itemManager else { return 0 }

        return itemManager.doneCount
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ItemCell",
            for: indexPath) as! ItemCell
        
        guard let itemManager = itemManager else { fatalError() }
        
        let item: ToDoItem

        item = itemManager.doneItem(at: indexPath.row)
        
        cell.configCell(with: item, checked: true)
        
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

        // remove done item

        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let itemManager = itemManager else { fatalError() }
 
        itemManager.uncheckItem(at: indexPath.row)
    
        tableView.reloadData()
    }

}