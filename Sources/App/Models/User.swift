//
//  User.swift
//  App
//
//  Created by Christian Bieniak on 7/5/18.
//

import FluentPostgreSQL
import Vapor

/// A single entry of a Todo list.
final class User: PostgreSQLUUIDModel {
    var id: UUID?
    var name: String
    /// The user's email
    var email: String
    
    /// Creates a new `User`.
    init(id: UUID? = nil, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}

/// Allows `User` to be used as a dynamic migration.
extension User: Migration { }

/// Allows `User` to be encoded to and decoded from HTTP messages.
extension User: Content { }

/// Allows `User` to be used as a dynamic parameter in route definitions.
extension User: Parameter { }
