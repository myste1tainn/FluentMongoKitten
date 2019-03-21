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
  
  @discardableResult
  public func insert() -> EventLoopFuture<InsertReply> {
    return Self.collection.insert(self.document)
  }
  
  @discardableResult
  public func update() -> EventLoopFuture<UpdateReply> {
    return Self.collection.update(where: "_id" == id, to: self.document)
  }
  
  @discardableResult
  public func delete() -> EventLoopFuture<Int> {
    return Self.collection.deleteOne(where: "_id" == id)
  }
  
  // MARK: - Alias / Shorthand
  
  @discardableResult
  public func save() -> EventLoopFuture<UpdateReply> {
    return Self.collection.upsert(where: "_id" == id, to: self.document)
  }
  
}
