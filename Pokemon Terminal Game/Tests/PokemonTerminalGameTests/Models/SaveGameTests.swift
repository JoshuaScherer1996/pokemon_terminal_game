import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the SaveGame

/// Unit tests for SaveGame using the AAA pattern.
final class SaveGameTests: XCTestCase {

    /// Should correctly encode and decode a SaveGame instance.
    func testEncodeDecodePreservesData() {
        // Arrange
        let caughtIDs = [1, 2, 3]
        let currentID = 2
        let saveGame = SaveGame(currentPokemonID: currentID, caughtIDs: caughtIDs)

        // Act
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let encodedData = try? encoder.encode(saveGame)
        let decoded = try? decoder.decode(SaveGame.self, from: encodedData ?? Data())

        // Assert
        XCTAssertNotNil(encodedData, "Encoded data should not be nil")
        XCTAssertNotNil(decoded, "Decoded object should not be nil")
        XCTAssertEqual(decoded?.currentPokemonID, currentID, "Current Pokémon ID should be preserved")
        XCTAssertEqual(decoded?.caughtIDs, caughtIDs, "Caught IDs should be preserved")
    }
}
