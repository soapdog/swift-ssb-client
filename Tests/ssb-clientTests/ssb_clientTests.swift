import XCTest
@testable import ssb_client

final class ssb_clientTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ssb_client().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
