/// Service responsible for handling battle-related logic between Pokemon.
final class BattleService {
    
    /// Performs an attack from one Pokemon to another and checks if the defender has fainted.
    ///
    /// - Parameters:
    ///   - attacker: The attacking Pokemon (will not be mutated).
    ///   - defender: The defending Pokemon whose HP will be reduced.
    /// - Returns: `true` if the defender has fainted after the attack, otherwise `false`.
    func performAttack(from attacker: inout Pokemon, to defender: inout Pokemon) -> Bool {
        defender.takeDamage(attacker.attack)
        return isFainted(defender)
    }

    /// Fully restores a Pokemon's HP to its maximum.
    ///
    /// - Parameter pokemon: The Pokemon to heal.
    func restoreHP(_ pokemon: inout Pokemon) {
        pokemon.currentHP = pokemon.maxHP
    }

    /// Checks whether a given Pokemon has fainted (i.e. HP is zero or less).
    ///
    /// - Parameter pokemon: The Pokemon to evaluate.
    /// - Returns: `true` if the Pokemon is fainted, otherwise `false`.
    var isFainted: (Pokemon) -> Bool = { $0.currentHP <= 0 }
}
