//
// Created by Arnon Keereena on 2019-03-12.
//

import Foundation
import MongoKitten

public final class FluentService {
  public var database: Database
  
  public convenience init(host: String, port: UInt = 27017, databaseName: String) throws {
    let string = "mongodb://\(host):\(port)/\(databaseName)"
    try self.init(connectionString: string)
  }
  
  required init(connectionString: String) throws {
    database = try .synchronousConnect(connectionString)
  }
  
  public func register<T: Fluent>(_ fluentType: T.Type) {
    fluentType.setCollection(database: database)
  }
}
