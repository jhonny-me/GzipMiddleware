import PackageDescription

let package = Package(
    name: "GzipMiddleware",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1),
        .Package(url: "https://github.com/Zewo/zlib.git", majorVersion: 0, minor: 4)
    ]
)
