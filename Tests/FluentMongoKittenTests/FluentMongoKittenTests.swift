import XCTest
@testable import FluentMongoKitten

final class FluentMongoKittenTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FluentMongoKitten().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
