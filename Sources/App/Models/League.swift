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
    
    var sportId: UUID
    
    /// Creates a new `League`.
    init(id: UUID? = nil, name: String, sportId: UUID) {
        self.id = id
        self.name = name
        self.sportId = sportId
    }
    
}

extension League {
    var sport: Parent<League, Sport> {
        return parent(\.sportId)
    }
}

extension League: Migration {
    static func prepare(on connection: Database.Connection) -> Future<Void> {
        return Database.create(self, on: connection, closure: { (builder) in
            try addProperties(to: builder)
            try builder.addReference(from: \.sportId, to: \Sport.id)
        })
    }
}
extension League: Content { }
extension League: Parameter { }
