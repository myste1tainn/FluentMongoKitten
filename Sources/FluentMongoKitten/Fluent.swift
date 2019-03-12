//
// Created by Arnon Keereena on 2019-03-11.
//

import Foundation
import BSONMapper
import MongoKitten

// Fluency protocol represent a model that is capable of running query against mongodb
// where MongoKitten is the driver behind
public protocol Fluent: DocumentMappable {
  
  var id: ObjectId? { get set }
  
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
  
  init(where query: Query)
  
  @discardableResult
  func insert() -> EventLoopFuture<InsertReply>
  
  @discardableResult
  func update() -> EventLoopFuture<UpdateReply>
  
  @discardableResult
  func delete() -> EventLoopFuture<Int>
}

