// MARK: Extension Battle for Pokemon

/// Extension that provides default battle behavior for `Pokemon`.
extension Pokemon: Battle {
      
    /// Indicates whether the Pokemon has fainted.
    var isFainted: Bool {
        return currentHP <= 0
    }
    
    /// Reduces the Pokemon's HP by a given amount.
    /// - Parameter amount: The amount of damage taken.
    mutating func takeDamage(_ amount: Int) {
        currentHP -= amount
    }
}
