// MARK: Protocol Battle

/// Protocol defining the battle-related properties and behaviors for Pokemon.
protocol Battle {
    var maxHP: Int { get }
    var currentHP: Int { get set}
    var attack: Int { get }
    var isFainted: Bool { get }
        
    mutating func takeDamage(_ amount: Int)
}
