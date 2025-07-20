import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the StateTransition

/// Unit tests for StateTransition using the AAA pattern.
final class StateTransitionTests: XCTestCase {

    /// A dummy GameState implementation for use in push tests.
    struct DummyState: GameState {
        func run(context: GameContext, io: TerminalIO) -> StateTransition {
            return .stay
        }
    }

    /// Should create a `.stay` transition correctly.
    func testStayCaseIsRecognizedCorrectly() {
        // Arrange
        let transition = StateTransition.stay

        // Act & Assert
        switch transition {
        case .stay:
            XCTAssertTrue(true, "Transition should be .stay")
        default:
            XCTFail("Expected .stay transition")
        }
    }

    /// Should create a `.pop` transition correctly.
    func testPopCaseIsRecognizedCorrectly() {
        // Arrange
        let transition = StateTransition.pop

        // Act & Assert
        switch transition {
        case .pop:
            XCTAssertTrue(true, "Transition should be .pop")
        default:
            XCTFail("Expected .pop transition")
        }
    }

    /// Should create a `.end` transition correctly.
    func testEndCaseIsRecognizedCorrectly() {
        // Arrange
        let transition = StateTransition.end

        // Act & Assert
        switch transition {
        case .end:
            XCTAssertTrue(true, "Transition should be .end")
        default:
            XCTFail("Expected .end transition")
        }
    }

    /// Should correctly associate a state with `.push`.
    func testPushCaseContainsCorrectState() {
        // Arrange
        let dummy = DummyState()
        let transition = StateTransition.push(dummy)

        // Act & Assert
        switch transition {
        case .push(let state):
            // We can't compare structs with `==`, so we use type check
            XCTAssertTrue(type(of: state) == DummyState.self, "State should be of type DummyState")
        default:
            XCTFail("Expected .push transition")
        }
    }
}
