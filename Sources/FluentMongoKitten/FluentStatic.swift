//
// Created by Arnon Keereena on 2019-03-12.
//

import Foundation
import NIO

public protocol FluentStatic {
  static var collectionName: String { get }
  
  static var collection: MongoCollection { get set }
  
  static func setCollection(database: MongoDatabase)
  
  static func insert(models: [Self]) -> [EventLoopFuture<InsertReply>]
  
  static func findOne<Query: QueryCursor>(where query: Query) -> EventLoopFuture<Self>
  
  static func find<Query: QueryCursor>(where query: Query) -> MappedCursor<Query, Self>
  
  static func update<Query: QueryCursor>(where query: Query, document: Document) -> EventLoopFuture<UpdateReply>
  
  static func update(models: [Self]) -> [EventLoopFuture<UpdateReply>]
  
  static func delete<Query: QueryCursor>(where query: Query) -> EventLoopFuture<Int>
  
  static func delete(models: [Self]) -> [EventLoopFuture<Int>]
  
}
