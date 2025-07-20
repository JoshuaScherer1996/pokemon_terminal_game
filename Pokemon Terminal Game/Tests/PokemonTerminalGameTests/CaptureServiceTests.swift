import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the CaptureService

/// Unit tests for the CaptureService using the AAA pattern.
final class CaptureServiceTests: XCTestCase {

    /// Should return true if chance is high and roll is low.
    func testCatchSuccess() {
        // Arrange
        let service = CaptureService()
        var pokemon = Pokemon(id: "001", name: "Catchmon", type: [.grass], maxHP: 100, attack: 50, catchDifficulty: 10, sprite: "")
        pokemon.currentHP = 10  // low HP increases chance
        let fakeRandom = { 0.1 }

        // Act
        let result = service.tryCatch(pokemon: pokemon, randomProvider: fakeRandom)

        // Assert
        XCTAssertTrue(result, "Expected catch to succeed due to high probability.")
    }

    /// Should return false if chance is low and roll is high.
    func testCatchFailure() {
        // Arrange
        let service = CaptureService()
        var pokemon = Pokemon(id: "002", name: "Hardmon", type: [.fire], maxHP: 100, attack: 50, catchDifficulty: 200, sprite: "")
        pokemon.currentHP = 100  // full HP lowers chance
        let fakeRandom = { 0.95 }

        // Act
        let result = service.tryCatch(pokemon: pokemon, randomProvider: fakeRandom)

        // Assert
        XCTAssertFalse(result, "Expected catch to fail due to low probability.")
    }
}
