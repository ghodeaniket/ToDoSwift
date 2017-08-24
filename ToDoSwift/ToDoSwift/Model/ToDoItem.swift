//
//  ToDoItem.swift
//  ToDoSwift
//
//  Created by Aniket Ghode on 23/08/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import Foundation

struct ToDoItem: Equatable {
    private let titleKey = "titleKey"
    private let itemDescriptionKey = "itemDescriptionKey"
    private let timestampKey = "timestampKey"
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    
    init(title: String,
         itemDescription: String? = nil,
         timestamp: Double? = nil) {
        
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
    }
    
    init?(dict: [String:Any]) {
        guard let title = dict[titleKey] as? String else
        { return nil }
        
        self.title = title
        
        self.itemDescription = dict[itemDescriptionKey] as? String
        self.timestamp = dict[timestampKey] as? Double
    }
    
    var plistDict: [String:Any] {
        var dict = [String:Any]()
        dict[titleKey] = title
        if let itemDescription = itemDescription {
            dict[itemDescriptionKey] = itemDescription
        }
        if let timestamp = timestamp {
            dict[timestampKey] = timestamp
        }
        return dict
    }
    
}

func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
    if lhs.timestamp != rhs.timestamp {
        return false
    }
    if lhs.itemDescription != rhs.itemDescription {
        return false
    }
    if lhs.title != rhs.title {
        return false
    }
    return true
}
