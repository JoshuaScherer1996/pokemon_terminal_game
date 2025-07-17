// MARK: Encoutner State

struct EncounterState: GameState {
    
    func run(context: GameContext, io: TerminalIO) -> StateTransition {
        let encounterService = EncounterService()
        
        let enemyPokemon = encounterService.getRandomUncaughtPokemon(using: context.pokedex) ?? PokeFactory.allPokemon()[0] // Quick and dirty dummy data as a fall back for now
        
        io.print(Messages.wildEncounterMessage(for: enemyPokemon))
        
        var isRunning: Bool = true
        
        while isRunning {
            
            // Display the battle menu
            io.print(Messages.battleMenu)
            let choice = io.waitFor(
                options: ["1", "2", "3", "4"],
                prompt: Messages.inputPromptNumbers
            )

            switch choice {
            case "1":
                //TODO: Implement attack
                io.print(
                        """
                        
                        Coming soon...
                        """
                )  // Placeholder
                return .stay

            case "2":
                //TODO: Implement capture
                io.print(
                        """
                        
                        Coming soon...
                        """
                )  // Placeholder
                return .stay

            case "3":
                //TODO: Implement switch pokemon
                io.print(
                        """
                        
                        Coming soon...
                        """
                )  // Placeholder
                return .stay

            case "4":
                //TODO: Implement flee
                io.print(
                        """
                        
                        Coming soon...
                        """
                )  // Placeholder
                return .stay

            default:
                // Unexpected input should not happen due to waitFor options
                return .stay
            }
            
            //TODO: Enemy turn here
        }
    }
}
