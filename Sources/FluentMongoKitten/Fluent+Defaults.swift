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
  
  public func insert() throws -> EventLoopFuture<InsertReply> {
    var object = self
    if object.id == nil {
        object.id = ObjectId.init()
    }
    let document = try BSONEncoder().encode(object)
    return Self.collection.insert(document)
  }
  
  public func update() throws -> EventLoopFuture<UpdateReply> {
    let document = try BSONEncoder().encode(self)
    return Self.collection.update(where: ["_id": id], to: document)
    
  }
  
  public func delete() -> EventLoopFuture<Int> {
    Self.collection.deleteOne(where: "_id" == id)
  }
  
  // MARK: - Alias / Shorthand
  
  public func save() throws -> EventLoopFuture<UpdateReply> {
    let document = try BSONEncoder().encode(self)
    return Self.collection.upsert(where: "_id" == id, to: document)
  }
  
}
