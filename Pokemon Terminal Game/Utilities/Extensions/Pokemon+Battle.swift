// MARK: Extension Battle for Pokemon

extension Pokemon: Battle {
      
    // Computed porperty that calculates it's status based on the current hp.
    var isFainted: Bool {
        return currentHP <= 0
    }
    
    // Method for taking damage
    mutating func takeDamage(_ amount: Int) {
        currentHP -= amount
    }
}
