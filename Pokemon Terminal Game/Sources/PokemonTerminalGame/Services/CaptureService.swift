// MARK: Capture Service

/// A service responsible for handling Pokemon capture attempts based on health and difficulty.
final class CaptureService {
    
    /// Attempts to catch a Pokemon using its `catchChance()` and remaining HP.
    ///
    /// The final capture probability is calculated by:
    /// - Combining the base catch chance from `Capture` protocol
    /// - Scaling it by the ratio of remaining HP
    /// - Ensuring a minimum success rate of 20% and a maximum of 100%
    ///
    /// - Parameters:
    ///   - pokemon: The encountered Pokemon the player is trying to catch.
    ///   - randomProvider: Random value generator between 0.0 and 1.0 (used for test injection).
    /// - Returns: `true` if the Pokemon was successfully caught, otherwise `false`.
    func tryCatch(pokemon: Pokemon, randomProvider: () -> Double = { Double.random(in: 0...1) }) -> Bool {
        let baseChance = pokemon.catchChance()
        let hpFactor = Double(pokemon.maxHP - pokemon.currentHP) / Double(pokemon.maxHP)
        let adjustedChance = max(0.05, min(1.0, baseChance + hpFactor)) // clamp between 5% and 100%
        
        return Double.random(in: 0...1) <= adjustedChance
    }
}
