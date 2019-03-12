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
  
  @discardableResult
  public static func insert(models: [Self]) -> [EventLoopFuture<InsertReply>] {
    return models.map { $0.insert() }
  }
  
  @discardableResult
  public static func find() -> MappedCursor<FindCursor, Self?> {
    return self.collection.find()
                          .map { Self(document: $0) }
  }
  
  @discardableResult
  public static func update(where query: Query, document: Document) -> EventLoopFuture<UpdateReply> {
    return Self.collection.update(where: query, to: document)
  }
  
  @discardableResult
  public static func update(models: [Self]) -> [EventLoopFuture<UpdateReply>] {
    return models.map { $0.update() }
  }
  
  @discardableResult
  public static func delete(models: [Self]) -> [EventLoopFuture<Int>] {
    return models.map { $0.delete() }
  }
  
  @discardableResult
  public static func delete(where query: Query) -> EventLoopFuture<Int> {
    return Self.collection.deleteAll(where: query)
  }
  
  // MARK: - instance queries
  
  @discardableResult
  public func insert() -> EventLoopFuture<InsertReply> {
    return Self.collection.insert(self.document)
  }
  
  @discardableResult
  public func update() -> EventLoopFuture<UpdateReply> {
    return Self.collection.update(where: "id" == id, to: self.document)
  }
  
  @discardableResult
  public func delete() throws -> EventLoopFuture<Int> {
    return Self.collection.deleteOne(where: "id" == id)
  }
  
  // MARK: - Alias / Shorthand
  
  @discardableResult
  public func save() -> EventLoopFuture<InsertReply> {
    return insert()
  }
}
