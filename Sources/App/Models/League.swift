//
//  League.swift
//  App
//
//  Created by Christian Bieniak on 9/5/18.
//

import FluentPostgreSQL
import Vapor

final class League: PostgreSQLUUIDModel {
    var id: UUID?
    var name: String
    
    /// Creates a new `League`.
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
    
}

extension League: Migration {}
extension League: Content { }
extension League: Parameter { }
