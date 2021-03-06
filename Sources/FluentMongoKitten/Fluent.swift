//
// Created by Arnon Keereena on 2019-03-11.
//

import Foundation
import BSONMapper
import MongoKitten

// Fluency protocol represent a model that is capable of running query against mongodb
// where MongoKitten is the driver behind
public protocol Fluent: FluentStatic, DocumentMappable {
  
  var id: ObjectId? { get set }
  
  @discardableResult
  func insert() -> EventLoopFuture<InsertReply>
  
  @discardableResult
  func update() -> EventLoopFuture<UpdateReply>
  
  @discardableResult
  func delete() -> EventLoopFuture<Int>
  
}

