// MARK: State Transition Enum

/// Represents a transition action between game states.
enum StateTransition {

    /// Remain in the current state.
    case stay

    /// Push a new state onto the stack of states.
    ///
    /// - Parameter:
    /// - Parameter Gamestate: The new State to enter.
    case push(GameState)

    /// Return to the previous state.
    case pop

    /// End the game loop entirely.
    case end
}
