//
// Created by Arnon Keereena on 2019-03-15.
//

import Foundation
import BSON
import BSONMapper
import MongoKitten
import FluentMongoKitten

struct Person: Fluent {
  
  // MARK: - Owned
  
  var name: String? = nil
  var lastname: String? = nil
  
  // MARK: - Fluent
  
  var id: ObjectId? = nil
  
  // MARK: - Document mappable
  
  init(name: String, lastname: String?) {
    self.name = name
    self.lastname = lastname
  }
  
  init?(map: Map) {
    self.name = nil
    self.lastname = nil
  }
  
  mutating func mapping(map: Map) {
    id <- map["_id"]
    name <- map["name"]
    lastname <- map["lastname"]
  }
}
