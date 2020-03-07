//
// Created by Arnon Keereena on 2019-03-11.
//

import Foundation
import MongoKitten

// Default implementations of fluency protocol
extension Fluent {
  
  public static var collectionName: String {
    return "\(Self.self)"
  }
  
  public static func setCollection(database: Database) {
    collection = database[self.collectionName]
  }
  
  @discardableResult
  public func insert() throws -> EventLoopFuture<InsertReply> {
    let document = try BSONEncoder().encode(self)
    return Self.collection.insert(document)
  }
  
  @discardableResult
  public func update() throws -> EventLoopFuture<UpdateReply> {
    let document = try BSONEncoder().encode(self)
    return Self.collection.update(where: "_id" == id, to: document)
    
  }
  
  @discardableResult
  public func delete() -> EventLoopFuture<Int> {
    Self.collection.deleteOne(where: "_id" == id)
  }
  
  // MARK: - Alias / Shorthand
  
  @discardableResult
  public func save() throws -> EventLoopFuture<UpdateReply> {
    let document = try BSONEncoder().encode(self)
    return Self.collection.upsert(where: "_id" == id, to: document)
  }
  
}
