// MARK: Encoutner State

struct EncounterState: GameState {
    
    func run(context: GameContext, io: TerminalIO) -> StateTransition {
        let encounterService = EncounterService()
        
        let enemyPokemon = encounterService.getRandomUncaughtPokemon(using: context.pokedex) ?? PokeFactory.allPokemon()[0] // Quick and dirty dummy data as a fall back for now
        
        io.print(Messages.wildEncounterMessage(for: enemyPokemon))
        
        // TODO: this input logic will be implemented into the user turn in the turn based system
        // Display the battle menu
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
