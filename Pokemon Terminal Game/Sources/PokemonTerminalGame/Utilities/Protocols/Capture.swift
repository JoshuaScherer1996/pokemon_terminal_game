// MARK: Capture Protocol

/// Protocol defining capture-related behavior for Pokemon.
protocol Capture {
    var catchDifficulty: Int { get }
    
    /// Calculates the chance to successfully catch a Pokemon.
    func catchChance() -> Double
}
