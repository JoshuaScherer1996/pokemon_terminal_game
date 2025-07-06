// MARK: Welcome State

/// Initial game state that shows the title splash and legal disclaimer.
struct WelcomeState: GameState {
    
    /// Displays the title and waits for user input to proceed.
    ///
    /// - Parameters:
    ///   - context: Shared game context (starter Pokemon, Pokedex, etc.).
    ///   - io: Handles user input and output in the terminal.
    /// - Returns: Ends the game or transitions to the next state.
    func run(context: GameContext, io: TerminalIO) -> StateTransition {
        io.print(AsciiArt.titleSplash)
        io.print(Messages.legalDisclaimer)
        io.waitFor("n", prompt: Messages.inputPromptNext)
        return .end
    }
}
