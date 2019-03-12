import XCTest
@testable import FluentMongoKitten

final class FluentServiceTests: XCTestCase {
  func test_connectToCorrectDb_itSuccess() {
    do {
      try FluentService(host: "localhost", databaseName: "fluentMongoKittenTest")
    } catch {
      
    }
  }
  
  func test_connectToWrongDb_itThrows() {
    
  }
  
  static var allTests = [
    ("test_connectToCorrectDb_itSuccess", test_connectToCorrectDb_itSuccess),
    ("test_connectToWrongDb_itThrows", test_connectToWrongDb_itThrows),
  ]
}
