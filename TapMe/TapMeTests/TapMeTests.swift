//
//  TapMeTests.swift
//  TapMeTests
//
//  Created by Michael Charland on 2017-12-14.
//  Copyright © 2017 Michael Charland. All rights reserved.
//

import XCTest

@testable import TapMe

class TapMeTests: XCTestCase {
    
    func testAfterSettingUpTheGameTheValuesAreSet() {
        let vc = ViewController()
        vc.setupGame()
        XCTAssertEqual(30, vc.seconds)
        XCTAssertEqual(0, vc.count)
    }
    
    func testTimerNotCreatedBeforeTheGameIsSetup() {
        let vc = ViewController()
        XCTAssertNil(vc.timer)
    }

    func testTimerIsCreatedBySetupGameAndIsReadyToGo() {
        let vc = ViewController()
        vc.setupGame()
        XCTAssertTrue(vc.timer.isValid)
    }
    
    func testTimerIsDeactivedWhenTheTimeHitsZero() {
        let vc = ViewController()
        vc.setupGame()
        vc.seconds = 1
        vc.subtractTime()
        XCTAssertEqual(0, vc.seconds)
        XCTAssertFalse(vc.timer.isValid)
    }
    
    func testbuttonPressedUpdatesCountValue() {
        let vc = ViewController()
        vc.setupGame()
        vc.buttonPressed()
        XCTAssertEqual(vc.count, 1)
    }
}
