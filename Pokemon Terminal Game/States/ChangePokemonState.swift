// MARK: Change Pokemon State

/// A game state that allows the player to switch their current Pokemon.
///
/// This state delegates the logic to `ChangePokemonService`, enabling reuse across multiple contexts (e.g. in battle or menus). After the selection is made, the state returns to the previous menu.
struct ChangePokemonState: GameState {
    
    /// Runs the state and invokes the Pokemon change service.
    ///
    /// - Parameters:
    ///   - context: The shared game context containing current Pokemon and Pokedex data.
    ///   - io: The terminal interface for input and output operations.
    /// - Returns: `.pop` to return to the previous game state.
    func run(context: GameContext, io: TerminalIO) -> StateTransition {
        let service = ChangePokemonService()
        service.changePokemon(in: context, using: io)
        return .pop
    }
}
