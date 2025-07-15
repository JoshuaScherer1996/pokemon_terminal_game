// MARK: Encoutner State

struct EncounterState: GameState {
    
    func run(context: GameContext, io: TerminalIO) -> StateTransition {
        // Display the play menu
        io.print(Messages.battleMenu)
        let choice = io.waitFor(
            options: ["1", "2", "3", "4"],
            prompt: Messages.inputPromptNumbers
        )

        switch choice {
        case "1":
            io.print(
                    """
                    
                    Coming soon...
                    """
            )  // Placeholder
            return .stay

        case "2":
            io.print(
                    """
                    
                    Coming soon...
                    """
            )  // Placeholder
            return .stay

        case "3":
            io.print(
                    """
                    
                    Coming soon...
                    """
            )  // Placeholder
            return .stay

        case "4":
            io.print(
                    """
                    
                    Coming soon...
                    """
            )  // Placeholder
            return .stay

        default:
            return .stay
        }
    }
}
