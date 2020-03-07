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
  
  static func findOne(where query: MongoKittenQuery) -> EventLoopFuture<Self>
  
  static func find(where query: MongoKittenQuery) -> MappedCursor<FindCursor, Self>
  
  static func update(where query: MongoKittenQuery, document: Document) -> EventLoopFuture<UpdateReply>
  
  static func update(models: [Self]) -> [EventLoopFuture<UpdateReply>]
  
  static func delete<Query: QueryCursor>(where query: Query) -> EventLoopFuture<Int>
  
  static func delete(models: [Self]) -> [EventLoopFuture<Int>]
  
}
