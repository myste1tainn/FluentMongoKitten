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
  
  static func collection(database: Database) -> MongoKitten.Collection
  
  static var collection: MongoKitten.Collection { get set }
  
  static func find(where query: Query) -> MappedCursor<FindCursor, Self>
  
  static func update(where query: Query, document: Document) -> [Self]
  
  static func update(models: [Self]) -> [Self]
  
  static func delete(where query: Query) -> [Self]
  
  static func delete(models: [Self]) -> [Self]
  
  init(where query: Query)
  
  func update(query: Query) throws -> Self
  
  func delete(query: Query) throws -> Self
}

