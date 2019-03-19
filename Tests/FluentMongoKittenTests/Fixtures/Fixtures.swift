//
// Created by Arnon Keereena on 2019-03-12.
//

import Foundation
import FluentMongoKitten

class Fixtures {
  static func setup() {
    let service = try! FluentService(host: "localhost", databaseName: "fluentmongokittenunittests")
    service.register(Person.self)
  }
}
