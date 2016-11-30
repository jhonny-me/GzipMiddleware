# GzipMiddleware
gzip enable  Middleware for Vapor

![Platforms](https://img.shields.io/badge/platforms-Linux%20%7C%20OS%20X-blue.svg)
![Package Managers](https://img.shields.io/badge/package%20managers-SwiftPM-yellow.svg)

## What is this
This is a middleware for [Vapor](https://vapor.codes/) framework to enable gzip on Server.

![screen shot 2016-11-30 at 23 53 16](https://cloud.githubusercontent.com/assets/9820374/20759641/6dfcba9c-b758-11e6-8749-0b19ec63f91b.png)

Checkout yourself: [http://checkgzipcompression.com/?url=https%3A%2F%2Frescueking.herokuapp.com%2Fscripts%2Fbundle.js](http://checkgzipcompression.com/?url=https%3A%2F%2Frescueking.herokuapp.com%2Fscripts%2Fbundle.js)

## How to use
#### Package (recommended)
1. add `.Package(url: "https://github.com/jhonny-me/GzipMiddleware.git", majorVersion: 0, minor: 1)` to Package.swift => dependencies
2. in your code `let drop = Droplet(availableMiddleware: ["gzip" :GzipMiddleware()])`
3. add `"gzip"` to Config/droplet.json => middleware => server

#### Manually
1. download or clone the repo
2. drop GzipMiddleware.swift and Data+Gzip.swift to your `<Project Dir>/Sources/App/Middlewares` folder
2. in your code `let drop = Droplet(availableMiddleware: ["gzip" :GzipMiddleware()])`
3. add `"gzip"` to Config/droplet.json => middleware => server

## ToDo

- [ ] use cache first
- [ ] cache gzipped data

## About
Thanks support from [https://github.com/1024jp/GzipSwift](https://github.com/1024jp/GzipSwift), [https://github.com/Zewo/CZlib](https://github.com/Zewo/CZlib)

## Licences

MIT
