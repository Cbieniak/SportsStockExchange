//
//  SportController.swift
//  App
//
//  Created by Christian Bieniak on 20/5/18.
//

@testable import App
import Vapor
import XCTest


final class SportController: XCTestCase {
    
    var app: Application!
    
    override func setUp() {
        do {
            var config = Config.default()
            var env = try Environment.testing
            var services = Services.default()
            env.commandInput.arguments = []
            
            try App.configure(&config, &env, &services)
            
            app = try Application(
                config: config,
                environment: env,
                services: services
            )
            
            try App.boot(app)
            try app.asyncRun().wait()
            
        } catch {
            fatalError("Failed to launch Vapor server: \(error.localizedDescription)")
        }
    }
    
    override func tearDown() {
        try? app.runningServer?.close().wait()
    }
    
    func testIndex() throws {
        
        let response = try app.client().get(DevelopmentConstants.developmentURL + RouteConstants.currentApi + "sports").wait()
        let sports = try response.content.syncDecode([Sport].self)
        XCTAssertEqual(sports.count, 1, "There should be one sport")
        XCTAssert(true)
    }
    
    static let allTests = [
        ("testIndex", testIndex)
    ]
}

