//
//  RatingsViewControllerTests.swift
//  TEDTalkRaterTests
//
//  Created by Beverly Massengill on 8/26/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import XCTest

@testable import TEDTalkRater

class RatingsViewControllerTests: XCTestCase {
    
    var ratingsViewController: RatingsViewController!
    
    override func setUp() {
        
        super.setUp()
        
        CoreDataHelper.reset()
        
        ratingsViewController = RatingsViewController()
        ratingsViewController.loadView()
    }
    
    func testLoadRatedTalksDoesSorting() {
        
        setUpSavedTalks()
        
        ratingsViewController.loadRatedTalks()
        
        XCTAssertEqual(ratingsViewController.ratedTalks.count, 4)
        
        XCTAssertEqual(ratingsViewController.ratedTalks[0].titleText, "aatest1")
        XCTAssertEqual(ratingsViewController.ratedTalks[1].titleText, "abtest1")
        XCTAssertEqual(ratingsViewController.ratedTalks[2].titleText, "actest1")
        XCTAssertEqual(ratingsViewController.ratedTalks[3].titleText, "atest1")
    }
    
    func setUpSavedTalks() {
        
        let _ = TEDTalk(title: "atest1", description: "test1 description", presenter: "presenter1", rating: 1.0, shouldPersist: true)
        
        let _ = TEDTalk(title: "abtest1", description: "test1 description", presenter: "presenter1", rating: 5.0, shouldPersist: true)
        
        let _ = TEDTalk(title: "actest1", description: "test1 description", presenter: "presenter1", rating: 5.0, shouldPersist: true)
        
        let _ = TEDTalk(title: "aatest1", description: "test1 description", presenter: "presenter1", rating: 5.0, shouldPersist: true)
        
        CoreDataHelper.save()
    }
}
