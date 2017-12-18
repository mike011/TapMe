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
    
    func testExample() {
        let vc = ViewController()
        vc.setupGame()
        XCTAssertEqual(30, vc.seconds)
        XCTAssertEqual(0, vc.count)
        
    }
}
