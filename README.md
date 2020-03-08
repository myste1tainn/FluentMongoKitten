# FluentMongoKitten
Fluency library taken after FluentSQLite (of Vapor), since Vapor have yet to support this officially.
This aims to complies and provides same API as Vapor does to all other `Fluent*` packages.

The libray is based off from MongoKitten, and is relying on `Codable` to read-from/write-to database and is base on SwiftNIO as MongoKitten does

# Development plan
1.0.0: It has to work.
2.0.0: It will have same API offered by Vapor in other `Fluent*` packages.
3.0.0: It will uses RxSwift as an underlying API to allow reactive changes.

