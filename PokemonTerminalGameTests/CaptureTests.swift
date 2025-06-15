// MARK: Unit Tests for capturing

import XCTest
@testable import Pokemon_Terminal_Game

final class CaptureTests: XCTestCase {
    /// Tests that the catch chance returns the minimum (0.05) when difficulty is at its maximum.
    func testCatchChanceReturnsMinimumWhenDifficultyIsHigh() {

        // Arrange: Create a Pokemon with the maximum catch difficulty.
        let hardToCatchPokemon = Pokemon(
                id: "999",
                name: "PokeLegend",
                type: [.psychic],
                maxHP: 100,
                attack: 50,
                catchDifficulty: 255 // max value, should give minimum chance
            )
        
        // Act: Calculate the catch chance.
        let chance = hardToCatchPokemon.catchChance()
        
        // Assert: Catch chance should be at minimum (0.05).
        XCTAssertEqual(chance, 0.05, accuracy: 0.0001, "Catch chance should be at minimum (0.05) for max difficulty.")
    }

    /// Tests that the catch chance returns the maximum (1.0) when difficulty is at its minimum.
    func testCatchChanceReturnsMaximumWhenDifficultyIsLow() {
        
        // Arrange: Create a Pokemon with the minimum catch difficulty.
        let easyToCatchPokemon = Pokemon(
            id: "000",
            name: "PokeStarter",
            type: [.electric],
            maxHP: 10,
            attack: 15,
            catchDifficulty: 0) // min value, should give maximum chance
        
        // Act: Calculate the catch chance.
        let chanc = easyToCatchPokemon.catchChance()
        
        // Assert: Catch chance should be at maximum (1.0).
        XCTAssertEqual(chanc, 1.0, accuracy: 0.0001, "Catch chance should be at maximum (1.0) for min difficulty.")
        
    }

    /// Tests that the catch chance is correctly calculated for a mid-range difficulty.
    func testCatchChanceReturnsMidRangeCorrectly() {
        
        // Arrange: Create a Pokemon with a mid-range catch difficulty.
        let midRangePokemon = Pokemon(
            id: "888",
            name: "PokeBalanced",
            type: [.normal],
            maxHP: 100,
            attack: 50,
            catchDifficulty: 127 // midpoint of 0–255
        )

        // Act: Calculate the catch chance.
        let chance = midRangePokemon.catchChance()

        // Assert: Catch chance should be approximately 0.5 (1.0 - 127/255).
        let expectedChance = 1.0 - Double(127) / 255.0
        XCTAssertEqual(chance, expectedChance, accuracy: 0.0001, "Catch chance should match expected mid-range calculation.")
    }

    /// Tests that the catch chance never drops below the defined minimum of 0.05,
    /// even if the catch difficulty exceeds the expected maximum.
    func testCatchChanceNeverBelowMinimum() {
        
        // Arrange: Create a Pokemon with an invalidly high catch difficulty.
        let brokenPokemon = Pokemon(
            id: "787",
            name: "PokeImpossible",
            type: [.ghost],
            maxHP: 100,
            attack: 50,
            catchDifficulty: 999 // way above the 255 cap
        )

        // Act: Calculate the catch chance.
        let chance = brokenPokemon.catchChance()

        // Assert: The result should never fall below the minimum threshold (0.05).
        XCTAssertEqual(chance, 0.05, accuracy: 0.0001, "Catch chance must never drop below 0.05 even for absurd difficulties.")
    }

    /// Tests that the catch chance never exceeds the defined maximum of 1.0,
    /// even if the catch difficulty drops below the expected minimum.
    func testCatchChanceNeverAboveMaximum() {
        
        // Arrange: Create a Pokemon with an invalidly low catch difficulty.
        let invalidPokemon = Pokemon(
            id: "020",
            name: "PokeInvalid",
            type: [.grass],
            maxHP: 100,
            attack: 50,
            catchDifficulty: -999 // way below the 0 cap
        )
        
        // Act: Calculate the catch chance.
        let chance = invalidPokemon.catchChance()
        
        // Assert: The result should never exceed the maximum threshold (1.0).
        XCTAssertEqual(chance, 1.0, accuracy: 0.0001, "Catch chance must never exceed 1.0 even for absurd difficulties.")
    }
}
