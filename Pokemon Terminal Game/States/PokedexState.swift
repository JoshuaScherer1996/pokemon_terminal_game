// MARK: Pokedex State

/// Displays the current Pokedex and returns to the play menu on user prompt.
struct PokedexState: GameState {
    
    /// Runs the Pokedex state and waits for confirmation to return.
    ///
    /// - Parameters:
    ///   - context: The shared game context containing the Pokedex data.
    ///   - io: The terminal input/output interface.
    /// - Returns: `.pop` to return to the previous state.
    func run(context: GameContext, io: TerminalIO) -> StateTransition {
        io.print(Messages.currentPokedex)
        
        let entries = context.pokedex.showEntries()
        for entry in entries {
            io.print("ID: \(entry.id), Name: \(entry.name), Type: \(entry.type)")
        }
        
        io.waitFor("n", prompt: Messages.inputPromptNext)
        return .pop
    }
}
