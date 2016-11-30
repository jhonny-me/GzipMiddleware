import Vapor
import GzipMiddleware

let drop = Droplet()
drop.addConfigurable(middleware: GzipMiddleware(), name: "gzip")


drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.resource("posts", PostController())

drop.run()
