//
// Created by Arnon Keereena on 2019-03-11.
//

import Foundation
import MongoKitten

// Fluency protocol represent a model that is capable of running query against mongodb
// where MongoKitten is the driver behind
public protocol Fluent: FluentStatic, Codable {
  
  var id: ObjectId? { get set }
  
  func insert() -> EventLoopFuture<InsertReply>
  
  func update() -> EventLoopFuture<UpdateReply>
  
  func delete() -> EventLoopFuture<Int>
  
}

