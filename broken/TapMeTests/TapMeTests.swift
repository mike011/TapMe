import XCTest

@testable import TapMe

class TapMeTests: XCTestCase {
    
    func testExample() {
        let vc = ViewController()
        vc.setupGame()
        XCTAssertEqual(30, vc.seconds)
        XCTAssertEqual(30, vc.count)

    }
}
