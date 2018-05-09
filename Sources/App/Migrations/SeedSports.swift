//
//  SeedSports.swift
//  App
//
//  Created by Christian Bieniak on 9/5/18.
//

import FluentPostgreSQL
import Vapor

struct SeedSports: Migration {
    
    typealias Database = PostgreSQLDatabase
    
    static func prepare(on connection: PostgreSQLConnection) -> Future<Void> {
        let sport = Sport(name: "Australian Rules Football")
        return sport.save(on: connection).transform(to: Void())
    }
    
    static func revert(on connection: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return Sport.query(on: connection).delete()
    }
}
