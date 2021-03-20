import XCTest

import ssb_clientTests

var tests = [XCTestCaseEntry]()
tests += ssb_clientTests.allTests()
XCTMain(tests)
