//
//  ToDoItem.swift
//  ToDoSwift
//
//  Created by Aniket Ghode on 23/08/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import Foundation

struct ToDoItem {
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    
    init( title: String, itemDescription: String? = nil, timestamp: Double? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
    }
}
