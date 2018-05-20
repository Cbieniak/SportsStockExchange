//
//  RouteConstants.swift
//  App
//
//  Created by Christian Bieniak on 20/5/18.
//

import Vapor

struct RouteConstants {
    static var api = "api"
    static var versionOne = "v1"
    
    static var currentApi: String {
        return "/\(RouteConstants.api)/\(RouteConstants.versionOne)/"
    }
}
