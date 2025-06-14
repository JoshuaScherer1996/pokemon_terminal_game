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

        // Assert: The Pokémon should not be fainted
        XCTAssertFalse(healthyPokemon.isFainted, "Expected `isFainted` to return false when HP > 0.")
    }

    
    // MARK: - Factory Creation
    
    /// Tests that the `PokeFactory` creates exactly 151 Pokemon as expected for Generation 1.
    func testFactoryCreatesAllPokemon() {
        // Act: Generate all Pokemon from the factory
        let allPokemon = PokeFactory.allPokemon()

        // Assert: The number of created Pokemon should be 151
        XCTAssertEqual(allPokemon.count, 151, "Expected 151 Pokémon, but got \(allPokemon.count).")
    }

    func testFactorySkipsInvalidTypesGracefully() {
        // TODO: Implement the test case
    }

    func testFirstPokemonHasCorrectValues() {
        // TODO: Implement the test case
    }

    func testAllCreatedPokemonHaveValidIDs() {
        // TODO: Implement the test case
    }

    func testAllCreatedPokemonHaveValidTypes() {
        // TODO: Implement the test case
    }
    
    //MARK: - Type Parsing
    
    func testSingleTypeIsParsedCorrectly() {
        // TODO: Implement the test case
    }

    func testDualTypeIsParsedCorrectly() {
        // TODO: Implement the test case
    }

    func testInvalidTypeReturnsNil() {
        // TODO: Implement the test case
    }

    func testEmptyTypeReturnsNil() {
        // TODO: Implement the test case
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
