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
    return models.map { $0.update() }
  }
  
  public static func delete(models: [Self]) -> [EventLoopFuture<Int>] {
    return models.map { $0.delete() }
  }
  
  public static func delete(where query: Query) -> EventLoopFuture<Int> {
    return Self.collection.deleteAll(where: query)
  }
  
  // MARK: - instance queries
  
  public func update() -> EventLoopFuture<UpdateReply> {
    return Self.collection.update(where: "id" == id, to: self.document)
  }
  
  public func delete() throws -> EventLoopFuture<Int> {
    return Self.collection.deleteOne(where: "id" == id)
  }
}
