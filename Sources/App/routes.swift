import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    router.group("api") { (router) in
        router.group("v1") { (router) in
            let userController = UserController()
            router.get("users", use: userController.index)
            router.post("users", use: userController.create)
            router.delete("users", User.parameter, use: userController.delete)
            
            let sportsController = SportController()
            router.get("sports", use: sportsController.index)
        }
    }
    
}
