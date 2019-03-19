//
// Created by Arnon Keereena on 2019-03-12.
//

import Foundation
import MongoKitten

extension FluentStatic where Self: Fluent {
  
  @discardableResult
  public static func insert(models: [Self]) -> [EventLoopFuture<InsertReply>] {
    return models.map { $0.insert() }
  }
  
  @discardableResult
  public static func find(where query: Query) -> MappedCursor<FindCursor, Self> {
    return self.collection.find(query)
                          .map {Self(document: $0)! }
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
  
}
