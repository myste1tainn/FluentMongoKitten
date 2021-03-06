// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "FluentMongoKitten",
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(
      name: "FluentMongoKitten",
      targets: ["FluentMongoKitten"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    
    .package(url: "https://github.com/OpenKitten/MongoKitten.git", from: "5.0.0"),
    
    .package(url: "https://github.com/myste1tainn/BSONMapper.git", from: "0.0.5")
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "FluentMongoKitten",
      dependencies: ["MongoKitten", "BSONMapper"]),
    .testTarget(
      name: "FluentMongoKittenTests",
      dependencies: ["FluentMongoKitten"]),
  ]
)
