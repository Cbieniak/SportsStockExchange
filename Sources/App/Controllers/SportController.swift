import Vapor

final class SportController {
    /// Returns a list of all `Sports`s.
    func index(_ req: Request) throws -> Future<[Sport]> {
        return Sport.query(on: req).all()
    }
}
