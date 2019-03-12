//
// Created by Arnon Keereena on 2019-03-12.
//

import Foundation
import MongoKitten

private var collectionKey: UInt = 0

extension Fluent {
  public static var collection: MongoKitten.Collection {
    get {
      return objc_getAssociatedObject(self, &collectionKey) as! MongoKitten.Collection
    }
    set {
      objc_setAssociatedObject(self, &collectionKey, newValue, .OBJC_ASSOCIATION_RETAIN)
    }
  }
}
