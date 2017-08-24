//
//  ToDoItemTests.swift
//  ToDoSwift
//
//  Created by Aniket Ghode on 23/08/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import XCTest
@testable import ToDoSwift

class ToDoItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit_ShouldTakeTitle() {
        let item = ToDoItem(title: "Test Title")
        XCTAssertEqual(item.title, "Test Title")
    }
    
    func testInit_ShouldSetTitleAndTimestamp () {
        let item = ToDoItem(title: "Test Title", timestamp: 0.0)
        XCTAssertEqual(item.timestamp, 0.0, "Initializer should set timestamp")
    }
    
}
