// MARK: Main Menu State

/// Represents the main menu of the game, allowing the player to select from the core options new game, continue, credits, or exit.
struct MainMenuState: GameState {
    
    /// Runs the main menu state and handles user input.
    ///
    /// - Parameters:
    ///   - context: The current game context holding shared game data.
    ///   - io: The terminal input/output interface.
    /// - Returns: A `StateTransition` that determines the next game state.
    func run(context: GameContext, io: TerminalIO) -> StateTransition {
        io.print(Messages.mainMenu)
        let choice = io.waitFor(
            options: ["1","2","3","4"],
            prompt: Messages.inputPromptNumbers
        )

        switch choice {
        case "1":
            return .push(NewGameState())
        case "2":
            io.print(Messages.noSave)        // Placeholder for save/load function
            return .end
        case "3":
            io.print(Messages.credits)
            return .stay
        case "4":
            io.print(Messages.exit)
            return .end
        default:   return .stay
        }
    }
}
