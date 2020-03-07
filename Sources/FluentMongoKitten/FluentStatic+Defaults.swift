//
// Created by Arnon Keereena on 2019-03-12.
//

import Foundation
import NIO

extension FluentStatic where Self: Fluent {
    
    public static func insert(models: [Self]) throws -> [EventLoopFuture<InsertReply>] {
        try models.map { try $0.insert() }
    }
    
    public static func findOne(where query: MongoKittenQuery) -> EventLoopFuture<Self?> {
        self.collection.findOne(query)
            .map { (document: Document?) -> Self? in
                guard let doc = document else { return nil}
                // TODO: Find a way to not force unwrap this
                return try! BSONDecoder().decode(Self.self, from: doc)
        }
    }
    
    public static func find(where query: MongoKittenQuery) -> MappedCursor<FindCursor, Self> {
        self.collection.find(query)
            .map { try BSONDecoder().decode(Self.self, from: $0) }
    }
    
    public static func update(where query: MongoKittenQuery,
                              object: Self) throws -> EventLoopFuture<UpdateReply> {
        update(where: query, document: try BSONEncoder().encode(object))
    }
    
    public static func update(where query: MongoKittenQuery,
                              document: Document) -> EventLoopFuture<UpdateReply> {
        Self.collection.update(where: query, to: document)
    }
    
    public static func update(models: [Self]) throws -> [EventLoopFuture<UpdateReply>] {
        try models.map { try $0.update() }
    }
    
    public static func delete(models: [Self]) -> [EventLoopFuture<Int>] {
        models.map { $0.delete() }
    }
    
    public static func delete(where query: MongoKittenQuery) -> EventLoopFuture<Int> {
        Self.collection.deleteAll(where: query)
    }
    
}
