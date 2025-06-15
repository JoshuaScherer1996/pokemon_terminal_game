// MARK: Unit Tests for the PokeFactory

import XCTest
@testable import Pokemon_Terminal_Game

final class PokeFactoryTests: XCTestCase {
    /// Tests that the `PokeFactory` creates exactly 151 Pokemon as expected for Generation 1.
    func testFactoryCreatesAllPokemon() {
        
        // Act: Generate all Pokemon from the factory
        let allPokemon = PokeFactory.allPokemon()

        // Assert: The number of created Pokemon should be 151
        XCTAssertEqual(allPokemon.count, 151, "Expected 151 Pokemon, but got \(allPokemon.count).")
    }

    /// Tests that the `PokeFactory` skips parsing invalid types and only returns valid types.
    func testFactorySkipsInvalidTypes() {
        
        // Arrange: Prepare test data with one invalid type entry.
        let testNumbers = ["001", "002"]
        let testNames = ["Validmon", "Invalidmon"]
        let testTypes = ["fire", "invalidtype"] // second entry will fail to parse
        let testHP = [50, 60]
        let testAttack = [55, 65]
        let testDifficulty = [100, 200]

        // Act: Run the factory using injected test data
        let result = PokeFactory.allPokemon(
            numbers: testNumbers,
            names: testNames,
            types: testTypes,
            hp: testHP,
            attack: testAttack,
            difficulty: testDifficulty
        )

        // Assert: Only the valid Pokemon should be returned
        XCTAssertEqual(result.count, 1, "Factory should skip invalid type entries and only return valid Pokemon.")
        XCTAssertEqual(result.first?.name, "Validmon", "Only the Pokemon with a valid type should be included.")
    }
    
    /// Tests that the `PokeFactory` skips a single invalid type in an otherwise valid full dataset.
    func testFactorySkipsSingleInvalidTypeAmongFullSet() {
        
        // Arrange: Clone full dataset and inject a single invalid type
        let names = pokemonNames
        var types = pokemonTypes
        let hp = pokemonHP
        let attack = pokemonAttack
        let numbers = pokemonNumbers
        let difficulty = pokemonCatchDifficulty
        
        // Invalidate the type of one specific Pokemon (e.g., index 50)
        let invalidIndex = 50
        types[invalidIndex] = "unknown_type"

        // Act: Use factory with mostly valid data and one invalid entry
        let pokedex = PokeFactory.allPokemon(
            numbers: numbers,
            names: names,
            types: types,
            hp: hp,
            attack: attack,
            difficulty: difficulty
        )

        // Assert: Only 150 Pokemon should be created instead of 151
        XCTAssertEqual(pokedex.count, 150, "Factory should skip exactly one invalid Pokemon and create the rest.")

        // For thoroughness: Ensure that the invalid entry was actually skipped
        let invalidName = pokemonNames[invalidIndex]
        let wasSkipped = !pokedex.contains { $0.name == invalidName }
        XCTAssertTrue(wasSkipped, "The Pokemon with the invalid type should be excluded from the result.")
    }

    /// Tests that the first Pokemon in the Pokedex is correctly initialized as Bulbasaur.
    func testFirstPokemonHasCorrectValues() {
        
        // Arrange: Define expected Pokemon and load Pokedex
        let bulbasaur = Pokemon(
            id: "001",
            name: "Bulbasaur",
            type: [.grass, .poison],
            maxHP: 45,
            attack: 49,
            catchDifficulty: 30
        )
        
        let pokedex = PokeFactory.allPokemon()
        
        // Act: Compare Bulbasaur with the first entry of the Pokedex
        let comparisonResult = pokedex[0] == bulbasaur
        
        // Assert: Check if Bulbasaur is actually the first entry of the Pokedex
        XCTAssertTrue(comparisonResult, "The first Pokemon in the Pokedex should be Bulbasaur.")
    }

    /// Tests that all created Pokemon from the `PokeFactory` have a valid non-empty ID.
    func testAllCreatedPokemonHaveValidIDs() {
        
        // Arrange: Create the full Pokedex from the factory
        let pokedex = PokeFactory.allPokemon()
        
        // Act: Check if all IDs are non-empty and properly formatted (e.g., "001", "025", "151")
        let allIDsValid = pokedex.allSatisfy { !$0.id.isEmpty && Int($0.id) != nil }
        
        // Assert: Ensure all IDs are valid
        XCTAssertTrue(allIDsValid, "Every created Pokemon should have a valid non-empty numeric ID.")
    }

    /// Tests that all created Pokemon have at least one valid type assigned.
    func testAllCreatedPokemonHaveValidTypes() {
        
        // Arrange: Create the full Pokedex using the factory
        let pokedex = PokeFactory.allPokemon()
        
        // Act: Check that all Pokemon have at least one valid type
        let allHaveValidTypes = pokedex.allSatisfy { !$0.type.isEmpty }
        
        // Assert: Ensure every Pokemon has a valid type list
        XCTAssertTrue(allHaveValidTypes, "Every created Pokemon should have at least one valid type.")
    }
}
