// MARK: Unit Tests for initialization

import XCTest
@testable import Pokemon_Terminal_Game

final class InitializationTests: XCTestCase {
    
    /// Tests that a newly created `Pokemon` instance sets `currentHP` equal to `maxHP` by default.
    func testCurrentHPIsInitializedAsMaxHP() {
        
        // Arrange: Create a test Pokemon with defined maxHP
        let pokemon = Pokemon(
            id: "999",
            name: "Testomon",
            type: [.fire],
            maxHP: 77,
            attack: 88,
            catchDifficulty: 50
        )

        // Act: Read currentHP
        let currentHP = pokemon.currentHP

        // Assert: currentHP should equal maxHP on initialization
        XCTAssertEqual(currentHP, pokemon.maxHP, "A new Pokemon's currentHP should be initialized to maxHP.")
    }

    /// Tests that a newly initialized Pokemon has the correct property values and is equal to an identical instance.
    func testPokemonInitializationWithCorrectValues() {
        
        // Arrange: Create two Pokemon with exactly the same properties
        let expected = Pokemon(id: "042", name: "Zubat", type: [.poison, .flying], maxHP: 40, attack: 45, catchDifficulty: 120)
        let actual = Pokemon(id: "042", name: "Zubat", type: [.poison, .flying], maxHP: 40, attack: 45, catchDifficulty: 120)

        // Act & Assert: The two instances should be equal if all fields were properly assigned
        XCTAssertEqual(actual, expected, "Two Pokemon with identical values should be equal.")
    }

    /// Tests that the `Pokemon` struct correctly stores and returns type data.
    func testPokemonStructHoldsCorrectTypeData() {
        
        // Arrange: Create a Pokemon with a known dual type
        let types: [PokeType] = [.ice, .water]
        let pokemon = Pokemon(
            id: "087",
            name: "Jimmy",
            type: types,
            maxHP: 90,
            attack: 70,
            catchDifficulty: 90
        )
        
        // Act: Access the stored type property
        let storedTypes = pokemon.type

        // Assert: The type property should match the original values
        XCTAssertEqual(storedTypes, types, "Pokemon should retain the exact type information provided at initialization.")
    }
}
