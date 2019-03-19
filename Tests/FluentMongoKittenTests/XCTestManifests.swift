import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(FluentServiceTests.allTests),
        testCase(FluentTests.allTests)
    ]
}
#endif
