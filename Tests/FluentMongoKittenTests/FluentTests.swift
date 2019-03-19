//
// Created by Arnon Keereena on 2019-03-15.
//

import Foundation
import XCTest
import MongoKitten
@testable import FluentMongoKitten

class FluentTests: XCTestCase {
  
  override class func setUp() {
    Fixtures.setup()
    Fxitures.clear()
  }
  
  func test_insert_whereModelHaveAllValue_itSave() {
    let person = Person(name: "Arnon", lastname: "Keereena")
    var reply: InsertReply!
    let execution = { reply = try person.insert().wait() }
    XCTAssertNoThrow(try execution())
    XCTAssertTrue((reply.isSuccessful))
  }
  
}
