//
// Created by Arnon Keereena on 2019-03-12.
//

import Foundation
import MongoKitten

private var collectionKey: UInt = 0
private let holder = ""

extension Fluent {
  public static var collection: MongoCollection {
    get {
      return objc_getAssociatedObject(holder, &collectionKey) as! MongoCollection
    }
    set {
      objc_setAssociatedObject(holder, &collectionKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
}

