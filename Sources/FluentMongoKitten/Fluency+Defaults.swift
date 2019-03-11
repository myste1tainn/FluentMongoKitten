//
// Created by Arnon Keereena on 2019-03-11.
//

import Foundation
import MongoKitten
import BSONMapper

// Default implementations of fluency protocol
extension Fluent {
  public static var collectionName: String {
    return "\(Self.self)"
  }
  
  public static func collection(database: Database) -> MongoKitten.Collection {
    return database[collectionName]
  }
  
  // MARK: - Static queries
  
  public static func find() -> MappedCursor<FindCursor, Self?> {
    return self.collection.find().map {
      Self(document: $0)
    }
  }
  
  public static func update(where query: Query, document: Document) -> [Self] {
    Self.collection.update(where: query, to: document)
    // TODO: Finish impl for returning updated records
    return []
  }
  
  public static func update(models: [Self]) -> [Self] {
    return models.map {
      // TODO: It should handle error and catch them all into array of results instead of returning all ok.
      try! $0.update(query: "id" == $0.id)
    }
  }
  
  // MARK: - instance queries
  
  public func update(_ query: Query) throws -> Self {
    Self.collection.update(where: query, to: self.document)
    return self
  }
  
  public func delete(_ query: Query) throws -> Self {
    Self.collection.deleteOne(where: query)
    return self
  }
}
