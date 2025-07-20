import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the EncounterService

/// Unit tests for the EncounterService using the AAA pattern.
final class EncounterTests: XCTestCase {

    /// Should return a valid random Pokémon from the list.
    func testRandomEncounterReturnsValidPokemon() {
        // Arrange
        let pokemon1 = Pokemon(id: "001", name: "TestmonA", type: [.fire], maxHP: 50, attack: 60, catchDifficulty: 100, sprite: AsciiPokemonArt.bulbasaur)
        let pokemon2 = Pokemon(id: "002", name: "TestmonB", type: [.water], maxHP: 55, attack: 65, catchDifficulty: 120, sprite: AsciiPokemonArt.pikachu)
        let service = EncounterService(pokedex: [pokemon1, pokemon2])

        // Act
        let result = service.randomEncounter()

        // Assert
        XCTAssertTrue([pokemon1, pokemon2].contains(result), "Encounter should return a Pokémon from the given list.")
    }

    /// Should always return the same Pokémon if only one is available.
    func testSinglePokemonEncounter() {
        // Arrange
        let solo = Pokemon(id: "003", name: "SoloMon", type: [.grass], maxHP: 45, attack: 50, catchDifficulty: 90, sprite: AsciiPokemonArt.mew)
        let service = EncounterService(pokedex: [solo])

        // Act
        let result = service.randomEncounter()

        // Assert
        XCTAssertEqual(result, solo, "Encounter should always return the only available Pokémon.")
    }
}
