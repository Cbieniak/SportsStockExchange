import FluentPostgreSQL
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    /// Register providers first
    try services.register(FluentPostgreSQLProvider())

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    /// middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)
    
    // Configure a Postgres database
    let postgres = PostgreSQLDatabase(config: setupDatabaseConfig(env))

    /// Register the configured SQLite database to the database config.
    var databases = DatabasesConfig()
    databases.add(database: postgres, as: .psql)
    services.register(databases)

    /// Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: User.self, database: .psql)
    migrations.add(model: Sport.self, database: .psql)
    migrations.add(migration: SeedSports.self, database: .psql)
    services.register(migrations)

}

func setupDatabaseConfig(_ environment: Environment) -> PostgreSQLDatabaseConfig {
    
    switch environment {
    case Environment.testing:
        return PostgreSQLDatabaseConfig(hostname: "localhost",
                                              port: 5432,
                                              username: "postgres",
                                              database: "Test",
                                              password: "admin")
    default:
        return PostgreSQLDatabaseConfig(hostname: "localhost",
                                              port: 5432,
                                              username: "postgres",
                                              database: "t2",
                                              password: "admin")
    }
}
