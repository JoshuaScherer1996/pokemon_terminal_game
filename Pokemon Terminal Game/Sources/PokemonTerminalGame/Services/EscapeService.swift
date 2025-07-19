// MARK: Escape Service

/// A service responsible for handling escape attempts during wild Pokemon encounters.
final class EscapeService {
    
    /// Attempts to escape from a battle.
    ///
    /// Uses a fixed probability:
    /// - 50% chance to escape successfully
    /// - 50% chance to fail
    ///
    /// - Returns: `true` if the player escaped successfully, otherwise `false`.
    func tryEscape() -> Bool {
        return Double.random(in: 0...1) <= 0.5
    }
}
