// MARK: Play Menu State

/// Displays the main play menu after choosing a starter Pokemon.
struct PlayMenuState: GameState {

    /// Runs the play menu and handles player input to navigate gameplay features.
    ///
    /// - Parameters:
    ///   - context: The shared game context holding current Pokemon and Pokedex.
    ///   - io: The terminal input/output interface.
    /// - Returns: A state transition depending on the user's menu choice.
    func run(context: GameContext, io: TerminalIO) -> StateTransition {
        // Display the play menu
        io.print(Messages.playMenu)
        let choice = io.waitFor(
            options: ["1", "2", "3", "4"],
            prompt: Messages.inputPromptNumbers
        )

        switch choice {
        case "1":
            return .push(EncounterState())

        case "2":
            return .push(ChangePokemonState())

        case "3":
            return .push(PokedexState())

        case "4":
            io.print(Messages.backToMainMenu)
            return .push(MainMenuState())

        default:
            return .stay
        }
    }
}
