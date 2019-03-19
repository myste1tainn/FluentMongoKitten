//
// Created by Arnon Keereena on 2019-03-12.
//

import Foundation
import FluentMongoKitten

class Fixtures {
  
  static let service = try! FluentService(host: "localhost", databaseName: "fluentmongokittenunittests")
  
  static func setup() {
    service.register(Person.self)
  }
  
  static func reset() {
    service.drop(Person.self)
  }
}
