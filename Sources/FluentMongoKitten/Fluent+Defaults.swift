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
  public func insert() -> EventLoopFuture<InsertReply> {
    return Self.collection.insertEncoded(self)
  }
  
  @discardableResult
  public func update() -> EventLoopFuture<UpdateReply> {
    let document = try! BSONEncoder().encode(self)
    return Self.collection.updateOne(where: "_id" == id, to: document)
    
  }
  
  @discardableResult
  public func delete() -> EventLoopFuture<DeleteReply> {
    Self.collection.deleteOne(where: "_id" == id)
  }
  
  // MARK: - Alias / Shorthand
  
  @discardableResult
  public func save() -> EventLoopFuture<UpdateReply> {
    let document = try! BSONEncoder().encode(self)
    return Self.collection.upsert("_id" == id, where: document)
  }
  
}
