import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the CaptureService

/// Unit tests for the CaptureService using the AAA pattern.
final class CaptureServiceTests: XCTestCase {

    /// Should always succeed when probability is high and HP is very low.
    func testCatchSuccessWithLowHPAndEasyCatch() {
        // Arrange
        let service = CaptureService()
        var bisasam = Pokemon(
            id: "001",
            name: "Bisasam",
            type: [.grass],
            maxHP: 45,
            attack: 49,
            catchDifficulty: 10,
            sprite: ""
        )
        bisasam.currentHP = 1
        let fakeRandom = { 0.05 }

        // Act
        let result = service.tryCatch(pokemon: bisasam, randomProvider: fakeRandom)

        // Assert
        XCTAssertTrue(result, "Expected catch to succeed with low HP and low catch difficulty.")
    }

    /// Should always fail when probability is low and HP is full.
    func testCatchFailsWithFullHPAndHardCatch() {
        // Arrange
        let service = CaptureService()
        var pikachu = Pokemon(
            id: "025",
            name: "Pikachu",
            type: [.electric],
            maxHP: 50,
            attack: 55,
            catchDifficulty: 255,
            sprite: ""
        )
        pikachu.currentHP = pikachu.maxHP
        let fakeRandom = { 0.95 }

        // Act
        let result = service.tryCatch(pokemon: pikachu, randomProvider: fakeRandom)

        // Assert
        XCTAssertFalse(result, "Expected catch to fail with full HP and high catch difficulty.")
    }
}
