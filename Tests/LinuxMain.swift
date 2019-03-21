import XCTest

import FluentMongoKittenTests

var tests = [XCTestCaseEntry]()
tests += FluentMongoKittenTests.allTests()
XCTMain(tests)