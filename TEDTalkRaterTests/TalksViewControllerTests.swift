//
//  TalksViewControllerTests.swift
//  TEDTalkRaterTests
//
//  Created by Beverly Massengill on 8/26/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import XCTest

@testable import TEDTalkRater

class TalksViewControllerTests: XCTestCase {
    
    var talksViewController: TalksViewController!
    var tedTalk1: TEDTalk!
    var tedTalk2: TEDTalk!
    
    override func setUp() {
        
        super.setUp()
        
        talksViewController = TalksViewController()
        talksViewController.loadView()
        
        tedTalk1 = TEDTalk(title: "test", description: "test description", presenter: "guy", rating: 2)
        
        tedTalk2 = TEDTalk(title: "test2", description: "test description2", presenter: "guy2", rating: 4)
    }
    
    func testHandleDataChange() {
        
        talksViewController.tedTalks = []
        
        talksViewController.handleDataChange()
        
        XCTAssertTrue(talksViewController.tableView.isHidden)
        XCTAssertFalse(talksViewController.noDataLabel.isHidden)
        
        talksViewController.tedTalks = [tedTalk1]
        
        talksViewController.handleDataChange()
        
        XCTAssertFalse(talksViewController.tableView.isHidden)
        XCTAssertTrue(talksViewController.noDataLabel.isHidden)
    }
    
    func testTableViewNumRows() {
        
        talksViewController.tedTalks = [tedTalk1, tedTalk2]
        talksViewController.filteredTalks = [tedTalk2]
        
        talksViewController.isFiltering = true
        
        var numRows = talksViewController.tableView(talksViewController.tableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(numRows, 1)
        
        talksViewController.isFiltering = false
        
        numRows = talksViewController.tableView(talksViewController.tableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(numRows, 2)
    }
    
    func testFilteringSetting() {
        
        talksViewController.searchBar(talksViewController.searchBar, textDidChange: "test")
        
        XCTAssertTrue(talksViewController.isFiltering)
        
        talksViewController.exitFilterMode()
        
        XCTAssertFalse(talksViewController.isFiltering)
    }
    
    func testSearchHandlesEmptyString() {
        
        talksViewController.tedTalks = [tedTalk1, tedTalk2]
        
        talksViewController.searchBar(talksViewController.searchBar, textDidChange: "")
        
        XCTAssertEqual(talksViewController.filteredTalks.count, 2)
    }
    
    func testSearchFiltersResults() {
        
        talksViewController.tedTalks = [tedTalk1, tedTalk2]
        
        talksViewController.searchBar(talksViewController.searchBar, textDidChange: "2")
        
        XCTAssertEqual(talksViewController.filteredTalks.count, 1)
        XCTAssertEqual(talksViewController.filteredTalks.first, tedTalk2)
    }
    
    func testSearchBarDidEndEditing() {
        
        talksViewController.isFiltering = true
        talksViewController.filteredTalks = [tedTalk1]
        
        talksViewController.searchBarTextDidEndEditing(talksViewController.searchBar)
        
        XCTAssertFalse(talksViewController.isFiltering)
        XCTAssertEqual(talksViewController.filteredTalks.count, 0)
    }
}
