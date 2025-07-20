import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the GameContext

/// Unit tests for GameContext using the AAA pattern.
final class GameContextTests: XCTestCase {

    /// Should initialize context with nil starter when no starter is provided.
    func testInitWithoutStarterSetsNilAndEmptyPokedex() {
        // Arrange
        let context = GameContext()

        // Assert
        XCTAssertNil(context.currentPokemon, "Current Pokémon should be nil if no starter is provided")
        XCTAssertTrue(context.pokedex.caughtIDs.isEmpty, "Pokedex should be empty when no starter is set")
    }

    /// Should initialize context with provided starter and set it as caught.
    func testInitWithStarterSetsPokemonAndCaughtID() {
        // Arrange
        let starter = PokeFactory.allPokemon().first(where: { $0.name == "Charmander" })!

        // Act
        let context = GameContext(starter: starter)

        // Assert
        XCTAssertEqual(context.currentPokemon?.name, "Charmander", "Starter Pokémon should be set as current")
        XCTAssertTrue(context.pokedex.caughtIDs.contains(4), "Starter ID should be in the caught Pokedex")
    }
}
