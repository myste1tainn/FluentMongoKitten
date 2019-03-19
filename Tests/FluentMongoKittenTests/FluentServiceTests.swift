import XCTest
@testable import FluentMongoKitten

final class FluentServiceTests: XCTestCase {
  
  func test_connectToCorrectDb_itSuccess() {
    let host = "localhost"
    let databaseName = "fluentMongoKittenTest"
    let execution = {
      _ = try FluentService(host: host, databaseName: databaseName)
    }
    XCTAssertNoThrow(try execution())
  }
  
  func test_connectToWrongDb_itThrows() {
    let host = "wronghostname"
    let databaseName = "fluentMongoKittenTest"
    let execution = {
      _ = try FluentService(host: host, databaseName: databaseName)
    }
    XCTAssertThrowsError(try execution())
  }
  
  static var allTests = [
    ("test_connectToCorrectDb_itSuccess", test_connectToCorrectDb_itSuccess),
    ("test_connectToWrongDb_itThrows", test_connectToWrongDb_itThrows),
  ]
}
