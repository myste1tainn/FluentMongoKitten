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
  
  public static func setCollection(database: Database) {
    collection = database[self.collectionName]
  }
  
  // MARK: - Static queries
  
  public static func find() -> MappedCursor<FindCursor, Self?> {
    return self.collection.find()
                          .map { Self(document: $0) }
  }
  
  public static func update(where query: Query, document: Document) -> EventLoopFuture<UpdateReply> {
    return Self.collection.update(where: query, to: document)
  }
  
  public static func update(models: [Self]) -> [EventLoopFuture<UpdateReply>] {
    return models.map { $0.update("id" == $0.id) }
  }
  
  // MARK: - instance queries
  
  public func update(_ query: Query) -> EventLoopFuture<UpdateReply> {
    return Self.collection.update(where: query, to: self.document)
  }
  
  public func delete(_ query: Query) throws -> EventLoopFuture<Int> {
    return Self.collection.deleteOne(where: query)
  }
}
