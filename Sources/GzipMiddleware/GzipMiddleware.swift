import Vapor
import HTTP
import Foundation

public final class GzipMiddleware: Middleware {
    public func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        let response = try! next.respond(to: request)
        
        if request.requiresGzip && response.gzippable && !response.isGzipped {
            // TODO: should check cache first
//            let gzipFilePath = self.workDir + "Public" + request.uri.path + ".gzip"
//            
//            guard FileManager.fileAtPath(filePath).exists else {
//                throw Abort.notFound
//            }
            
            if
                let bytes = response.body.bytes,
                let data = try? Data(bytes: bytes).gzipped(),
                let dataBody = try? data.makeBytes() {
                
                response.body = .data(dataBody)
                response.headers["Content-Encoding"] = "gzip"
                response.headers["Content-Length"] = "\(data.count)"
                // TODO: write gzip data back in another thread
                
            }
        }
        
        return response
    }
    
    public init() {}
}

extension Request {
    var requiresGzip: Bool {
        return self.headers["Accept-Encoding"]?.contains("gzip") ?? false
    }
}

extension Response {
    var gzippable: Bool {
        dump(contentType)
        guard let contentType = contentType else { return false }
        if contentType.contains("text/html") || contentType.contains("application/javascript") || contentType.contains("text/css") {
            return true
        }
        return false
    }
    
    var isGzipped: Bool {
        guard let data = self.body.bytes else { return false }
        return Data(bytes: data).isGzipped
    }
}
