import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the GameCoordinator

/// Unit tests for GameCoordinator using the AAA pattern.
final class GameCoordinatorTests: XCTestCase {

    /// A mock TerminalIO implementation that does nothing.
    final class MockIO: TerminalIO {
        func print(_ text: String) {}
        func readLine() -> String { return "" }
    }

    /// A mock game state that returns `.end` immediately.
    struct EndState: GameState {
        func run(context: GameContext, io: TerminalIO) -> StateTransition {
            return .end
        }
    }

    /// Should initialize with a custom state and run the coordinator without crashing or hanging.
    func testCoordinatorEndsImmediatelyWithEndState() {
        // Arrange
        let coordinator = GameCoordinator(io: MockIO(), initialState: EndState())

        // Act & Assert
        XCTAssertNoThrow(coordinator.run(), "Coordinator should terminate cleanly when the state returns .end")
    }
}
