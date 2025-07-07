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
            io.print(
                    """
                    
                    Wild encounter coming soon...
                    """
            )  // Placeholder
            return .stay

        case "2":
            io.print(
                """

                Change Pokémon feature not implemented yet.
                """
            )  // Placeholder
            return .stay

        case "3":
            io.print(
                """
                
                Show Pokédex feature not implemented yet.
                """
            )
            return .stay

        case "4":
            io.print(
                """

                Returning to Main Menu...
                """
            )
            return .push(MainMenuState())

        default:
            return .stay
        }
    }
}
