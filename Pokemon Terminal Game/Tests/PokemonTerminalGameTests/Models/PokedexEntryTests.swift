import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the PokedexEntry

/// Unit tests for PokedexEntry using the AAA pattern.
final class PokedexEntryTests: XCTestCase {

    /// Should correctly initialize a PokedexEntry with all properties.
    func testInitCreatesCorrectEntry() {
        // Arrange
        let id = 25
        let name = "Pikachu"
        let type = "Electric"

        // Act
        let entry = PokedexEntry(id: id, name: name, type: type)

        // Assert
        XCTAssertEqual(entry.id, id, "ID should match")
        XCTAssertEqual(entry.name, name, "Name should match")
        XCTAssertEqual(entry.type, type, "Type should match")
    }
}
