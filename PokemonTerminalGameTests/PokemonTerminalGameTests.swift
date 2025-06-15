// MARK: Unit Tests

import XCTest
@testable import Pokemon_Terminal_Game

final class PokemonTerminalGameTests: XCTestCase {
    
    // MARK: - Capture Logic
    
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
    
    // MARK: - Battle Logic
    
    /// Tests that the `takeDamage` method correctly reduces the Pokemon's current HP.
    func testTakeDamageReducesCurrentHP() {
        
        // Arrange: Create a Pokemon with known initial HP.
        var testPokemon = Pokemon(
            id: "741",
            name: "PokeDummy",
            type: [.normal],
            maxHP: 100,
            attack: 30,
            catchDifficulty: 100
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
            catchDifficulty: 100
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
            catchDifficulty: 100
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
            catchDifficulty: 100
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
            catchDifficulty: 80
        )

        // Act: Inflict partial damage
        healthyPokemon.takeDamage(30)

        // Assert: The Pokemon should not be fainted
        XCTAssertFalse(healthyPokemon.isFainted, "Expected `isFainted` to return false when HP > 0.")
    }

    
    // MARK: - Factory Creation
    
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
    
    //MARK: - Type Parsing
    
    /// Tests that a single-type string (e.g. "fire") is parsed correctly into one `PokeType`.
    func testSingleTypeIsParsedCorrectly() {
        
        // Arrange: Create custom test data with a single-type Pokemon
        let testNumbers = ["001"]
        let testNames = ["Firemon"]
        let testTypes = ["fire"]
        let testHP = [50]
        let testAttack = [60]
        let testDifficulty = [100]
        
        // Act: Use factory with custom input
        let result = PokeFactory.allPokemon(
            numbers: testNumbers,
            names: testNames,
            types: testTypes,
            hp: testHP,
            attack: testAttack,
            difficulty: testDifficulty
        )
        
        // Assert: The single type should be parsed correctly
        XCTAssertEqual(result.count, 1, "One Pokemon should be created.")
        XCTAssertEqual(result.first?.type, [.fire], "The type should be parsed correctly as a single fire type.")
    }

    /// Tests that a dual-type string (e.g. "fire/flying") is parsed correctly into two `PokeType` values.
    func testDualTypeIsParsedCorrectly() {
        
        // Arrange: Create custom test data with a dual-type Pokemon
        let testNumbers = ["006"]
        let testNames = ["Flarewing"]
        let testTypes = ["fire/flying"]
        let testHP = [78]
        let testAttack = [84]
        let testDifficulty = [200]
        
        // Act: Use factory with custom input
        let result = PokeFactory.allPokemon(
            numbers: testNumbers,
            names: testNames,
            types: testTypes,
            hp: testHP,
            attack: testAttack,
            difficulty: testDifficulty
        )
        
        // Assert: The dual types should be parsed correctly
        XCTAssertEqual(result.count, 1, "One Pokemon should be created.")
        XCTAssertEqual(result.first?.type, [.fire, .flying], "The types should be parsed correctly as [fire, flying].")
    }
    
    /// Tests that `PokeParser.parseTypes(from:)` returns only the valid types from a mixed input string.
    func testPartiallyValidTypeReturnsOnlyValidOnes() {
        
        // Arrange: Provide a type string with one valid and one invalid type
        let mixedTypeString = "fire/banana"

        // Act: Attempt to parse the string
        let result = PokeParser.parseTypes(from: mixedTypeString)

        // Assert: Only the valid type should be included in the result
        XCTAssertEqual(result, [.fire], "parseTypes should return only the valid types from the input string.")
    }

    /// Tests that `PokeParser.parseTypes(from:)` returns `nil` when given an invalid type string.
    func testInvalidTypeReturnsNil() {
        
        // Arrange: Prepare an invalid type string that doesn't match any known PokeType
        let invalidTypeString = "apple/banana"

        // Act: Try to parse the invalid type string
        let result = PokeParser.parseTypes(from: invalidTypeString)

        // Assert: The result should be nil
        XCTAssertNil(result, "parseTypes should return nil for completely invalid type strings.")
    }

    /// Tests that `PokeParser.parseTypes(from:)` returns `nil` when given an empty string.
    func testEmptyTypeReturnsNil() {
        
        // Arrange: Use an empty type string
        let emptyTypeString = ""

        // Act: Try to parse the empty string
        let result = PokeParser.parseTypes(from: emptyTypeString)

        // Assert: The result should be nil, as there are no valid types to parse
        XCTAssertNil(result, "parseTypes should return nil when given an empty string.")
    }
    
    //MARK: - Initialization
    
    func testCurrentHPIsInitializedAsMaxHP() {
        // TODO: Implement the test case
    }

    func testPokemonInitializationWithCorrectValues() {
        // TODO: Implement the test case
    }

    func testPokemonStructHoldsCorrectTypeData() {
        // TODO: Implement the test case
    }
    
}
