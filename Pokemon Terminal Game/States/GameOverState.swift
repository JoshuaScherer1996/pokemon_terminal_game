// MARK: - Game Over State

/// A state that represents the end of the game when the Pokedex is complete.
struct GameOverState: GameState {
    
    /// Runs the Game Over sequence.
    ///
    /// - Parameters:
    ///   - context: The current game context, holding the player's progress.
    ///   - io: The I/O interface for terminal interaction.
    /// - Returns: A state transition that exits the game.
    func run(context: GameContext, io: TerminalIO) -> StateTransition {
        io.print(Messages.gameOverInfo)
        
        io.waitFor("n", prompt: Messages.inputPromptNext)
        
        // Shows full Pokedex
        let entries = context.pokedex.showEntries()
        for entry in entries {
            io.print("ID: \(entry.id), Name: \(entry.name), Type: \(entry.type)")
        }
        
        io.waitFor("n", prompt: Messages.inputPromptNext)
        
        io.print(Messages.credits)
        
        return .end
    }
}
