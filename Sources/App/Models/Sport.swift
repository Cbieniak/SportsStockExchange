//
//  Sport.swift
//  App
//
//  Created by Christian Bieniak on 7/5/18.
//

import FluentPostgreSQL
import Vapor

final class Sport: PostgreSQLUUIDModel {
    var id: UUID?
    var name: String
    
    /// Creates a new `Sport`.
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }

}

extension Sport: Migration {
    static func prepare(on connection: PostgreSQLConnection) -> Future<Void> {
        let result =  Database.create(self, on: connection) { builder in
            try builder.field(for: \.id)
            try builder.field(for: \.name)
        }
        let sport = Sport(name: "Australian Rules Football")
        //add extra sports here
        return result.and(sport.save(on: connection)).map { (res, _) in return res }
        
    }
    
}
extension Sport: Content { }
extension Sport: Parameter { }
