//
//  TEDTalkRaterUITests.swift
//  TEDTalkRaterUITests
//
//  Created by Beverly Massengill on 8/23/18.
//  Copyright © 2018 bmassengill. All rights reserved.
//

import XCTest

class TEDTalkRaterUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments.append(Constants.Tests.testsParam)
        app.launch()
    }
    
    func testSaveRatings() {
        
        let talkTitle = "Simplicity sells"
        
        XCTAssertTrue(app.otherElements[Constants.ScreenTitles.talksScreenTitle].exists)
        XCTAssertTrue(app.staticTexts[Constants.Labels.loadingLabel].exists)
        
        XCTAssertTrue(app.activityIndicators[Constants.Accessibility.loadingIndicator].exists)
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons[Constants.Labels.ratedTab].tap()
        XCTAssertTrue(app.staticTexts[Constants.Labels.noRatingsLabel].exists)
        
        tabBarsQuery.buttons[Constants.Labels.searchTab].tap()
        XCTAssertTrue(app.tables[Constants.Accessibility.talksTable].staticTexts[talkTitle].waitForExistence(timeout: 10))
        app.tables.staticTexts[talkTitle].tap()
        
        app.otherElements[Constants.Accessibility.ratingView].tap()
        
        app.navigationBars[Constants.ScreenTitles.talksScreenTitle].buttons[Constants.ScreenTitles.talksScreenTitle].tap()
        
        tabBarsQuery.buttons[Constants.Labels.ratedTab].tap()
        XCTAssertTrue(app.tables[Constants.Accessibility.ratingsTable].staticTexts[talkTitle].waitForExistence(timeout: 1))
        app.tables[Constants.Accessibility.ratingsTable].staticTexts[talkTitle].tap()
    }
    
    func testSearch() {
        
        let talkTitle = "Simplicity sells"
        let filteredTalkTitle = "Behind the design of Seattle's library"

        XCTAssertTrue(app.otherElements[Constants.ScreenTitles.talksScreenTitle].exists)
    XCTAssertTrue(app.tables[Constants.Accessibility.talksTable].staticTexts[talkTitle].waitForExistence(timeout: 10))

        let searchbar = app.otherElements[Constants.Accessibility.searchBar].children(matching: .searchField).element
        searchbar.tap()
        
        searchbar.typeText("lib")
        
        app.tables[Constants.Accessibility.talksTable].staticTexts[filteredTalkTitle].tap()
        
        app.otherElements[Constants.Accessibility.ratingView].tap()
        
        app.navigationBars[Constants.ScreenTitles.talksScreenTitle].buttons[Constants.ScreenTitles.talksScreenTitle].tap()
        
        app.tabBars.buttons[Constants.Labels.ratedTab].tap()
        XCTAssertTrue(app.tables[Constants.Accessibility.ratingsTable].staticTexts[filteredTalkTitle].waitForExistence(timeout: 1))
    }
    
    func testRickRoll() {
        
        XCTAssertTrue(app.otherElements[Constants.ScreenTitles.talksScreenTitle].exists)
        
        app.buttons[Constants.Tests.shakeGesture].tap()
        XCTAssertTrue(app.images[Constants.Accessibility.rickImage].exists)
        
        app.buttons[Constants.Accessibility.endRickRoll].tap()
    }
}
