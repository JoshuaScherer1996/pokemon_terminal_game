// MARK: Encoutner State

struct EncounterState: GameState {
    
    func run(context: GameContext, io: TerminalIO) -> StateTransition {
        let battleService = BattleService()
        
        var playerPokemon = context.currentPokemon ?? PokeFactory.allPokemon()[24] // Quick and dirty dummy data as a fall back for now
        
        var enemyPokemon = EncounterService().getRandomUncaughtPokemon(using: context.pokedex) ?? PokeFactory.allPokemon()[0] // Quick and dirty dummy data as a fall back for now
        
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
                if battleService.performAttack(from: &playerPokemon, to: &enemyPokemon) {
                    io.print(Messages.enemyDefeatedMessage(enemyPokemon))
                    io.print(Messages.playMenu)
                    return .pop
                }
                
                io.print(Messages.attackResultMessage(attacker: playerPokemon, target: enemyPokemon, damage: playerPokemon.attack))
                
            case "2":
                //TODO: Implement capture
                io.print(
                        """
                        
                        Coming soon...
                        """
                )  // Placeholder
                
            case "3":
                //TODO: Implement switch pokemon
                io.print(
                        """
                        
                        Coming soon...
                        """
                )  // Placeholder
                
            case "4":
                //TODO: Implement flee
                io.print(
                        """
                        
                        Coming soon...
                        """
                )  // Placeholder
                
            default:
                // Unexpected input should not happen due to waitFor options
                return .stay
            }
            
            //TODO: Enemy turn here
            isRunning = true
        }
        
        return .pop
    }
}
