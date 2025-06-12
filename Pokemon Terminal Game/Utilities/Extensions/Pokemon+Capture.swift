// MARK: Extension Capture for Pokemon

// Extension implements the capture protocol for the Pokemon struct.
extension Pokemon: Capture {
    
    // Function calculates the chance so that there will always be a value between 0.05 and 1.0.
    func catchChance() -> Double {
        return max(0.05, min(1.0, 1.0 - Double(catchDifficulty) / 255.0))
    }
}
