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
  
  static func find(where query: Query) -> MappedCursor<FindCursor, Self>
  
  static func update(where query: Query, document: Document) -> EventLoopFuture<UpdateReply>
  
  static func update(models: [Self]) -> [EventLoopFuture<UpdateReply>]
  
  static func delete(where query: Query) -> EventLoopFuture<Int>
  
  static func delete(models: [Self]) -> [EventLoopFuture<Int>]
  
  init(where query: Query)
  
  func update() -> EventLoopFuture<UpdateReply>
  
  func delete() -> EventLoopFuture<Int>
}

