//
// Created by Arnon Keereena on 2019-03-12.
//

import Foundation
import MongoKitten

private var storage = [String: MongoCollection]()

extension Fluent {
    public static var collection: MongoCollection {
        get {
            if let collection = storage[collectionName] {
                return collection
            } else {
                fatalError(
                    """
                    Collection instance for \(collectionName) is not yet registered,
                    it must be done via `FluentService.register(_:)`
                    """
                )
            }
        }
        set {
            storage[collectionName] = newValue
        }
    }
}

