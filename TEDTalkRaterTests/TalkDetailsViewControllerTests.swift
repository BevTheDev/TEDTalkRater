//
//  TalkDetailsViewControllerTests.swift
//  TEDTalkRaterTests
//
//  Created by Beverly Massengill on 8/26/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import XCTest

@testable import TEDTalkRater

class TalkDetailsViewControllerTests: XCTestCase {
    
    var detailsVC: TalkDetailsViewController!
    var unsavedTalk: TEDTalk!
    
    override func setUp() {
        
        super.setUp()
        
        CoreDataHelper.reset()
        
        unsavedTalk = TEDTalk(title: "test", description: "test description", presenter: "guy", rating: 0.0)
        
        detailsVC = TalkDetailsViewController(tedTalk: unsavedTalk)
        detailsVC.loadView()
    }
    
    func testUISetup() {
        
        detailsVC.viewDidLoad()
        
        XCTAssertEqual(detailsVC.titleLabel.text, "test")
        XCTAssertEqual(detailsVC.descriptionLabel.text, "test description")
        XCTAssertEqual(detailsVC.presenterLabel.text, "Presenter: guy")
        XCTAssertEqual(detailsVC.ratingView.rating, 0.0)
    }
    
    func testLoadSavedRating() {
        
        let _ = TEDTalk(title: "test", description: "test description", presenter: "guy", rating: 4.0, shouldPersist: true)
        CoreDataHelper.save()
        
        detailsVC.viewDidLoad()
        
        XCTAssertEqual(detailsVC.ratingView.rating, 4.0)
    }
    
    func testSavesOnDisappear() {
        
        let _ = TEDTalk(title: "test", description: "test description", presenter: "guy", rating: 4.0, shouldPersist: true)
        CoreDataHelper.save()
        
        detailsVC.ratingView.rating = 2.0
        
        detailsVC.viewWillDisappear(false)
        
        let results = CoreDataHelper.fetchRatedTalks()
        
        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results.first?.rating, 2)
    }
    
    func testSkipsSaveIfNoRating() {
        
        detailsVC.viewWillDisappear(false)
        
        let results = CoreDataHelper.fetchRatedTalks()
        
        XCTAssertEqual(results.count, 0)
    }
    
    func testSaveRatingCreatesNewRecord() {
        
        detailsVC.ratingView.rating = 1.0
        
        detailsVC.saveRating()
        
        let results = CoreDataHelper.fetchRatedTalks()
        
        XCTAssertEqual(results.count, 1)
        XCTAssertEqual(results.first?.rating, 1)
    }
}
