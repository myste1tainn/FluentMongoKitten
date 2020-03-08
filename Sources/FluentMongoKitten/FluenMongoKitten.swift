//
// Created by Arnon Keereena on 2019-03-11.
//

import Foundation
import MongoKitten
import BSON

public typealias BSONEncoder = BSON.BSONEncoder
public typealias BSONDecoder = BSON.BSONDecoder
public typealias Document = BSON.Document
public typealias ObjectId = BSON.ObjectId

public typealias FindCursor = MongoKitten.FindCursor
public typealias MongoCollection = MongoKitten.Collection
public typealias QueryCursor = MongoKitten.QueryCursor
public typealias MongoDatabase = MongoKitten.Database
public typealias MappedCursor<Base: QueryCursor, Element> = MongoKitten.MappedCursor<Base, Element>
public typealias FinalizedCursor<Base: QueryCursor> = MongoKitten.FinalizedCursor<Base>

public typealias InsertReply = MongoKitten.InsertReply
public typealias UpdateReply = MongoKitten.UpdateReply
public typealias MongoKittenQuery = MongoKitten.Query
