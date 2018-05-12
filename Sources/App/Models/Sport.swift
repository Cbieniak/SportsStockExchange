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

extension Sport: Migration { }
extension Sport: Content { }
extension Sport: Parameter { }

extension Sport {
    var leagues: Children<Sport, League> {
        return children(\.sportId)
    }
}
