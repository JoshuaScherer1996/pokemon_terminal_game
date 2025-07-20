// MARK: Escape Service

/// A service responsible for handling escape attempts during wild Pokemon encounters.
final class EscapeService {
    
    /// Attempts to escape from a battle.
    ///
    /// Uses a fixed probability:
    /// - 50% chance to escape successfully
    /// - 50% chance to fail
    ///
    /// - Parameter randomProvider: Injected for testability (default: random).
    /// - Returns: `true` if the player escaped successfully, otherwise `false`.
    func attemptEscape(randomProvider: () -> Double = { Double.random(in: 0...1) }) -> Bool {
        return randomProvider() <= 0.5
    }
}
