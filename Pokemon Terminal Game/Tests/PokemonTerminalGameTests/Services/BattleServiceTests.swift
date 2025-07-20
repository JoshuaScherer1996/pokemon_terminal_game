import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the BattleService

/// Unit tests for the BattleService using the AAA pattern.
final class BattleServiceTests: XCTestCase {
    
    /// Should reduce defender HP and mark as fainted if attack is lethal.
    func testAttackCausesFainting() {
        // Arrange
        var attacker = Pokemon(id: "001", name: "Aggressor", type: [.fire], maxHP: 50, attack: 60, catchDifficulty: 50, sprite: "")
        var defender = Pokemon(id: "002", name: "Defender", type: [.grass], maxHP: 40, attack: 30, catchDifficulty: 50, sprite: "")
        defender.currentHP = 40
        let service = BattleService()
        
        // Act
        let fainted = service.performAttack(from: &attacker, to: &defender)
        
        // Assert
        XCTAssertTrue(fainted, "Expected defender to faint after receiving lethal damage.")
    }

    /// Should not mark defender as fainted if damage is not lethal.
    func testAttackDoesNotCauseFainting() {
        // Arrange
        var attacker = Pokemon(id: "001", name: "Aggressor", type: [.fire], maxHP: 50, attack: 10, catchDifficulty: 50, sprite: "")
        var defender = Pokemon(id: "002", name: "Defender", type: [.grass], maxHP: 40, attack: 30, catchDifficulty: 50, sprite: "")
        defender.currentHP = 40
        let service = BattleService()
        
        // Act
        let fainted = service.performAttack(from: &attacker, to: &defender)
        
        // Assert
        XCTAssertFalse(fainted, "Expected defender to survive a low-damage attack.")
    }

    /// Should restore a Pokémon’s HP to maximum.
    func testRestoreHP() {
        // Arrange
        var pokemon = Pokemon(id: "003", name: "Healer", type: [.water], maxHP: 100, attack: 20, catchDifficulty: 80, sprite: "")
        pokemon.currentHP = 20
        let service = BattleService()
        
        // Act
        service.restoreHP(&pokemon)
        
        // Assert
        XCTAssertEqual(pokemon.currentHP, pokemon.maxHP, "Expected HP to be fully restored.")
    }

    /// Should return true if random roll is below the given probability.
    func testChanceAttackSucceededTrue() {
        // Arrange
        let service = BattleService()
        
        // Act
        let result = service.chanceAttackSucceeded(probability: 1.0)
        
        // Assert
        XCTAssertTrue(result, "Expected chance to succeed when probability is 1.0.")
    }

    /// Should return false if random roll is above the given probability.
    func testChanceAttackSucceededFalse() {
        // Arrange
        let service = BattleService()
        
        // Act
        let result = service.chanceAttackSucceeded(probability: 0.0)
        
        // Assert
        XCTAssertFalse(result, "Expected chance to fail when probability is 0.0.")
    }
}
