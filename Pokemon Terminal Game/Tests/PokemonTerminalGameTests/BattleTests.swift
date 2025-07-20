// MARK: Unit Tests for battling

import XCTest
@testable import PokemonTerminalGame

final class BattBattleTests: XCTestCase {
    
    /// Tests that the `takeDamage` method correctly reduces the Pokemon's current HP.
    func testTakeDamageReducesCurrentHP() {
        
        // Arrange: Create a Pokemon with known initial HP.
        var testPokemon = Pokemon(
            id: "741",
            name: "PokeDummy",
            type: [.normal],
            maxHP: 100,
            attack: 30,
            catchDifficulty: 100,
            sprite: ""
        )

        // Act: Inflict 40 damage.
        testPokemon.takeDamage(40)

        // Assert: Current HP should be reduced by 40.
        XCTAssertEqual(testPokemon.currentHP, 60, "Current HP should be 60 after taking 40 damage from 100.")
    }

    /// Tests that the `takeDamage` method correctly reduces the Pokemon's current HP to zero.
    func testTakeDamageReducesHPToZero() {
        
        // Arrange: Create a Pokemon with known initial HP.
        var testPokemon = Pokemon(
            id: "489",
            name: "PokeDummy",
            type: [.normal],
            maxHP: 100,
            attack: 30,
            catchDifficulty: 100,
            sprite: ""
        )
        
        // Act: Inflict 100 damage.
        testPokemon.takeDamage(100)
        
        // Assert: Current HP should be reduced to 0.
        XCTAssertEqual(testPokemon.currentHP, 0, "Current HP should be 0 after taking 100 damage from 100.")
    }

    /// Tests that the `isFainted` property returns `true` when `currentHP` is 0.
    func testIsFaintedReturnsTrueWhenHPIsZero() {
        
        // Arrange: Create a Pokemon with known initial HP.
        let faintedPokemon = Pokemon(
            id: "686",
            name: "Faintmon",
            type: [.ghost],
            maxHP: 50,
            attack: 20,
            catchDifficulty: 100,
            sprite: ""
        )

        // Override currentHP to simulate fainted state
        var testPokemon = faintedPokemon
        testPokemon.takeDamage(50) // Simulate losing all HP

        // Assert: Check if `isFainted` returns true
        XCTAssertTrue(testPokemon.isFainted, "Expected `isFainted` to return true when HP is 0.")
    }
    
    /// Tests that the `isFainted` property returns `true` when `currentHP` is below 0.
    func testIsFaintedReturnsTrueWhenHPIsBelowZero() {
        
        // Arrange: Create a Pokemon with known initial HP.
        let faintedPokemon = Pokemon(
            id: "968",
            name: "Super Faintmon",
            type: [.bug],
            maxHP: 50,
            attack: 20,
            catchDifficulty: 100,
            sprite: ""
        )

        // Override currentHP to simulate fainted state
        var testPokemon = faintedPokemon
        testPokemon.takeDamage(100) // Simulate losing all HP and more

        // Assert: Check if `isFainted` returns true
        XCTAssertTrue(testPokemon.isFainted, "Expected `isFainted` to return true when HP is below 0.")
    }

    /// Tests that the `isFainted` property returns `false` when `currentHP` is above 0.
    func testIsFaintedReturnsFalseWhenHPAboveZero() {
        
        // Arrange: Create a Pokemon with full HP.
        var healthyPokemon = Pokemon(
            id: "347",
            name: "Toughmon",
            type: [.rock],
            maxHP: 60,
            attack: 25,
            catchDifficulty: 80,
            sprite: ""
        )

        // Act: Inflict partial damage
        healthyPokemon.takeDamage(30)

        // Assert: The Pokemon should not be fainted
        XCTAssertFalse(healthyPokemon.isFainted, "Expected `isFainted` to return false when HP > 0.")
    }
}
