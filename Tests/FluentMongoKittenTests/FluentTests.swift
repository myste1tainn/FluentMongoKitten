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
  }
  
  override func tearDown() {
    Fixtures.reset()
  }
  
  func test_insert_whereModelHaveAllValue_itSave() {
    let person = Person(name: "Arnon", lastname: "Keereena")
    var reply: InsertReply!
    let execution = { reply = try person.insert().wait() }
    XCTAssertNoThrow(try execution())
    XCTAssertTrue((reply.isSuccessful))
  }
  
  func test_find_fromPreviousValue_itFound() {
    try? Person(name: "Arnon", lastname: "Keereena").insert().wait()
    
    let find = Person.find(where: "name" == "Arnon")
    var person: Person?
    let execution = { person = try find.getFirstResult().wait() }
    XCTAssertNoThrow(try execution())
    XCTAssertNotNil(person)
    XCTAssertEqual(person?.name, "Arnon")
    XCTAssertEqual(person?.lastname, "Keereena")
  }
  
  func test_update_fromPreviousValue_itChangesOnTheSameId() {
    try? Person(name: "Arnon", lastname: "Keereena").insert().wait()
    var person = try! Person.find(where: "name" == "Arnon").getFirstResult().wait()
    let expectId = person?.id
    person?.lastname = "Acme"
    try? person?.update().wait()
    
    var updatedPerson: Person?
    let find = Person.find(where: "name" == "Arnon")
    let execution = { updatedPerson = try find.getFirstResult().wait() }
    XCTAssertNoThrow(try execution())
    XCTAssertNotNil(updatedPerson)
    XCTAssertEqual(updatedPerson?.id, expectId)
    XCTAssertEqual(updatedPerson?.name, "Arnon")
    XCTAssertEqual(updatedPerson?.lastname, "Acme")
  }
  
  func test_delete_fromPreviousValue_itDeleted() {
    try! Person(name: "Arnon", lastname: "Keereena").insert().wait()
    let person = try! Person.find(where: "name" == "Arnon").getFirstResult().wait()
    XCTAssertNotNil(person, "inserted not nil")
    
    let execution = { try person?.delete().wait() }
    XCTAssertNoThrow(try execution())
    XCTAssertNil(try! Person.find(where: "name" == "Arnon").getFirstResult().wait())
  }
  
  func test_save_newlyCreatedObject_itInsert() {
    let person = Person(name: "Arnon", lastname: "Keereena")
    _ = try? person.save().wait()
    
    let find = Person.find(where: "name" == "Arnon")
    var savedPerson: Person?
    let execution = { savedPerson = try find.getFirstResult().wait() }
    XCTAssertNoThrow(try execution())
    XCTAssertNotNil(savedPerson)
    XCTAssertEqual(savedPerson?.name, "Arnon")
    XCTAssertEqual(savedPerson?.lastname, "Keereena")
  }
  
  func test_save_existingObject_itUpdate() {
    _ = (try? Person(name: "Arnon", lastname: "Keereena").insert().wait())
    var person = try! Person.find(where: "name" == "Arnon").getFirstResult().wait()
    let expectId = person?.id
    person?.lastname = "Acme"
    _ = try? person?.save().wait()
    
    let find = Person.find(where: "name" == "Arnon")
    var savedPerson: Person?
    let execution = { savedPerson = try find.getFirstResult().wait() }
    XCTAssertNoThrow(try execution())
    XCTAssertNotNil(savedPerson)
    XCTAssertEqual(savedPerson?.id, expectId)
    XCTAssertEqual(savedPerson?.name, "Arnon")
    XCTAssertEqual(savedPerson?.lastname, "Acme")
  }
}
