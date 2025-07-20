import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the SaveManager

/// Unit tests for SaveManager using the AAA pattern.
final class SaveManagerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        SaveManager.clear()
    }

    override func tearDown() {
        SaveManager.clear()
        super.tearDown()
    }

    /// Should correctly save and load a SaveGame from disk.
    func testSaveAndLoadReturnsCorrectData() {
        // Arrange
        let saveGame = SaveGame(currentPokemonID: 42, caughtIDs: [1, 3, 5])

        // Act
        SaveManager.save(game: saveGame)
        let loaded = SaveManager.load()

        // Assert
        XCTAssertNotNil(loaded, "Loaded save should not be nil")
        XCTAssertEqual(loaded?.currentPokemonID, 42, "Current Pokémon ID should match")
        XCTAssertEqual(loaded?.caughtIDs, [1, 3, 5], "Caught IDs should match")
    }

    /// Should return nil after save is cleared.
    func testClearDeletesSaveFile() {
        // Arrange
        let saveGame = SaveGame(currentPokemonID: 99, caughtIDs: [9, 8, 7])
        SaveManager.save(game: saveGame)

        // Act
        SaveManager.clear()
        let loaded = SaveManager.load()

        // Assert
        XCTAssertNil(loaded, "Loaded save should be nil after deletion")
    }
}
