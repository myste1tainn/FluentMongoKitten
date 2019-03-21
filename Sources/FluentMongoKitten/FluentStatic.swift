//
// Created by Arnon Keereena on 2019-03-12.
//

import Foundation
import MongoKitten

public protocol FluentStatic {
  static var collectionName: String { get }
  
  static var collection: MongoKitten.Collection { get set }
  
  static func setCollection(database: Database)
  
  @discardableResult
  static func insert(models: [Self]) -> [EventLoopFuture<InsertReply>]
  
  @discardableResult
  static func find(where query: Query) -> MappedCursor<FindCursor, Self>
  
  @discardableResult
  static func update(where query: Query, document: Document) -> EventLoopFuture<UpdateReply>
  
  @discardableResult
  static func update(models: [Self]) -> [EventLoopFuture<UpdateReply>]
  
  @discardableResult
  static func delete(where query: Query) -> EventLoopFuture<Int>
  
  @discardableResult
  static func delete(models: [Self]) -> [EventLoopFuture<Int>]
  
}
