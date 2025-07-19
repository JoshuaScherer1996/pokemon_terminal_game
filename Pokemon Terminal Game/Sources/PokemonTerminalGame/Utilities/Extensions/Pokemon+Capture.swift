// MARK: Extension Capture for Pokemon

// Extension that provides capture logic for `Pokemon`.
extension Pokemon: Capture {
    
    /// Calculates the chance to catch this Pokemon.
    /// - Returns:A value between 0.05 and 1.0.
    func catchChance() -> Double {
        return max(0.05, min(1.0, 1.0 - Double(catchDifficulty) / 255.0))
    }
}
