import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the PokedexManager

/// Unit tests for PokedexManager using the AAA pattern.
final class PokedexManagerTests: XCTestCase {

    /// Should initialize caughtIDs with starter Pokémon.
    func testInitWithStarterAddsStarterID() {
        // Arrange
        let starter = PokeFactory.allPokemon().first(where: { $0.id == "004" })! // Charmander

        // Act
        let manager = PokedexManager(starter: starter)

        // Assert
        XCTAssertTrue(manager.caughtIDs.contains(4), "Starter Pokémon ID should be marked as caught")
    }

    /// Should initialize caughtIDs correctly from saved data.
    func testInitFromCaughtIDsInitializesCorrectly() {
        // Arrange
        let caught = [1, 4]

        // Act
        let manager = PokedexManager(from: caught)

        // Assert
        XCTAssertEqual(manager.caughtIDs, Set(caught), "Caught IDs should match initialized values")
    }

    /// Should add new caught Pokémon to the caughtIDs set.
    func testGotCaughtAddsPokemonID() {
        // Arrange
        let manager = PokedexManager(from: [])
        let bulbasaur = PokeFactory.allPokemon().first(where: { $0.id == "001" })!

        // Act
        manager.gotCaught(bulbasaur)

        // Assert
        XCTAssertTrue(manager.caughtIDs.contains(1), "Newly caught Pokémon ID should be added")
    }

    /// Should return Pokedex entries with correct visibility.
    func testShowEntriesReturnsVisibleAndHiddenEntries() {
        // Arrange
        let manager = PokedexManager(from: [1]) // Bulbasaur caught

        // Act
        let entries = manager.showEntries()

        // Assert
        let bulbasaurEntry = entries.first(where: { $0.id == 1 })
        let charmanderEntry = entries.first(where: { $0.id == 4 })

        XCTAssertNotNil(bulbasaurEntry)
        XCTAssertEqual(bulbasaurEntry?.name, "Bulbasaur", "Caught Pokémon should be shown")

        XCTAssertNotNil(charmanderEntry)
        XCTAssertEqual(charmanderEntry?.name, "???", "Uncaught Pokémon should be hidden")
    }
}
