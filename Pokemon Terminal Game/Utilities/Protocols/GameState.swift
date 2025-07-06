// MARK: Game State Protocol

/// Represents a single game state in the state-based game flow.
protocol GameState {

    /// Runs the logic of the current state.
    ///
    /// - Parameters:
    ///   - context: Shared game data like current Pokémon and Pokédex.
    ///   - io: Terminal input/output handler.
    /// - Returns: A transition instruction to control the game flow.
    @discardableResult
    func run(context: GameContext, io: TerminalIO) -> StateTransition
}
