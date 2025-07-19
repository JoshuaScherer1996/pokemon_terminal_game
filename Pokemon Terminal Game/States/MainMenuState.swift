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
        // New Game Option
        case "1":
            SaveManager.clear()
            context.reset()
            return .push(NewGameState())
        // Continue Option
        case "2":
            if let save = SaveManager.load() {
                io.print(Messages.loadSuccess)
                context.apply(save: save)
                return .push(PlayMenuState())
            } else {
                io.print(Messages.noSave)
                return .stay
            }
        // Credits Option
        case "3":
            io.print(Messages.credits)
            io.waitFor("n", prompt: Messages.inputPromptNext)
            return .stay
        // Exit Option
        case "4":
            io.print(Messages.exit)
            return .end
        default:   return .stay
        }
    }
}
