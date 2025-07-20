import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the EscapeService

/// Unit tests for the EscapeService using the AAA pattern.
final class EscapeTests: XCTestCase {

    /// Should return true when random chance is below the escape threshold.
    func testEscapeSuccess() {
        // Arrange
        let service = EscapeService()
        let fakeRandom: () -> Double = { 0.1 }

        // Act
        let result = service.attemptEscape(randomProvider: fakeRandom)

        // Assert
        XCTAssertTrue(result, "Expected `result` to return true when the probability is <= 0.5.")
    }

    /// Should return false when random chance is above the escape threshold.
    func testEscapeFailure() {
        // Arrange
        let service = EscapeService()
        let fakeRandom: () -> Double = { 0.9 }

        // Act
        let result = service.attemptEscape(randomProvider: fakeRandom)

        // Assert
        XCTAssertFalse(result, "Expected `result` to return false when the probability is > 0.5.")
    }
}
