//
// Created by Arnon Keereena on 2019-03-11.
//

import Foundation
import MongoKitten
import MongoKittenCore
import MongoCore
import MongoClient
import BSON

public typealias BSONEncoder = BSON.BSONEncoder
public typealias BSONDecoder = BSON.BSONDecoder
public typealias Document = BSON.Document

public typealias FindQueryBuilder = MongoKitten.FindQueryBuilder
public typealias MongoCollection = MongoKitten.MongoCollection
public typealias QueryCursor = MongoKitten.QueryCursor
public typealias Database = MongoKitten.MongoDatabase
public typealias MappedCursor<Base: QueryCursor, Element> = MongoKitten.MappedCursor<Base, Element>
public typealias FinalizedCursor<Base: QueryCursor> = MongoKitten.FinalizedCursor<Base>

public typealias InsertReply = MongoKittenCore.InsertReply
public typealias UpdateReply = MongoKittenCore.UpdateReply
public typealias DeleteReply = MongoKittenCore.DeleteReply
public typealias MongoKittenQuery = MongoKittenCore.MongoKittenQuery
