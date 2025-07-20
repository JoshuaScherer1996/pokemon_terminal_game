import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the PokeParser

final class ParserTests: XCTestCase {
    
    /// Tests that a single-type string (e.g. "fire") is parsed correctly into one `PokeType`.
    func testSingleTypeIsParsedCorrectly() {
        
        // Arrange: Create custom test data with a single-type Pokemon
        _ = ["001"]
        let testNames = ["Firemon"]
        let testTypes = ["fire"]
        let testHP = [50]
        let testAttack = [60]
        let testDifficulty = [100]
        
        // Act: Use factory with custom input
        let result = PokeFactory.allPokemon(
            names: testNames,
            types: testTypes,
            hps: testHP,
            attacks: testAttack,
            difficulties: testDifficulty
        )
        
        // Assert: The single type should be parsed correctly
        XCTAssertEqual(result.count, 1, "One Pokemon should be created.")
        XCTAssertEqual(result.first?.type, [.fire], "The type should be parsed correctly as a single fire type.")
    }

    /// Tests that a dual-type string (e.g. "fire/flying") is parsed correctly into two `PokeType` values.
    func testDualTypeIsParsedCorrectly() {
        
        // Arrange: Create custom test data with a dual-type Pokemon
        _ = ["006"]
        let testNames = ["Flarewing"]
        let testTypes = ["fire/flying"]
        let testHP = [78]
        let testAttack = [84]
        let testDifficulty = [200]
        
        // Act: Use factory with custom input
        let result = PokeFactory.allPokemon(
            names: testNames,
            types: testTypes,
            hps: testHP,
            attacks: testAttack,
            difficulties: testDifficulty
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
}
