// MARK: Encoutner State

struct EncounterState: GameState {
    
    func run(context: GameContext, io: TerminalIO) -> StateTransition {
        let battleService = BattleService()
        
        var playerPokemon = context.currentPokemon ?? PokeFactory.allPokemon()[24] // Quick and dirty dummy data as a fall back for now
        
        var enemyPokemon = EncounterService().getRandomUncaughtPokemon(using: context.pokedex) ?? PokeFactory.allPokemon()[0] // Quick and dirty dummy data as a fall back for now
        
        io.print(Messages.wildEncounterMessage(for: enemyPokemon))
        
        let isRunning: Bool = true
        
        while isRunning {
            
            io.print(Messages.playerTurn(with: playerPokemon.name, playerPokemon.sprite))
            
            // Display the battle menu
            io.print(Messages.battleMenu)
            let choice = io.waitFor(
                options: ["1", "2", "3", "4"],
                prompt: Messages.inputPromptNumbers
            )
            
            switch choice {
                // Attack Pokemon
            case "1":
                if battleService.performAttack(from: &playerPokemon, to: &enemyPokemon) {
                    io.print(Messages.attackResultMessage(attacker: playerPokemon, target: enemyPokemon, damage: playerPokemon.attack))
                    io.print(Messages.enemyDefeatedMessage(enemyPokemon))
                    return .pop
                }
                
                io.print(Messages.attackResultMessage(attacker: playerPokemon, target: enemyPokemon, damage: playerPokemon.attack))
                
            // Catch Pokemon
            case "2":
                let success = CaptureService().tryCatch(pokemon: enemyPokemon)
                
                io.print(Messages.catchingAttempt(enemyPokemon))
                
                if success {
                    io.print(Messages.catchSuccess(enemyPokemon))
                    battleService.restoreHP(&enemyPokemon)
                    context.pokedex.gotCaught(enemyPokemon)
                    return .pop
                } else {
                    io.print(Messages.catchFailed(enemyPokemon))
                }
                
            // Switch Pokemon
            case "3":
                let didChange: Bool = ChangePokemonService().changePokemon(in: context, using: io)
                
                if didChange {
                    playerPokemon = context.currentPokemon!
                } else {
                    continue
                }
                
            case "4":
                //TODO: Implement flee
                io.print(
                        """
                        
                        Coming soon...
                        """
                )  // Placeholder
                return .pop
                
            default:
                // Unexpected input should not happen due to waitFor options
                return .stay
            }
            
            // Start of the enemies turn
            io.print(Messages.enemyTurn(of: enemyPokemon.name, enemyPokemon.sprite))
            
            if battleService.chanceAttackSucceeded(probability: 0.8) {
                if battleService.performAttack(from: &enemyPokemon, to: &playerPokemon) {
                    io.print(Messages.attackResultMessage(attacker: enemyPokemon, target: playerPokemon, damage: enemyPokemon.attack))
                    io.print(Messages.playerPokemonFaintedMessage(playerPokemon))
                    return .pop
                }
                
                io.print(Messages.attackResultMessage(attacker: enemyPokemon, target: playerPokemon, damage: playerPokemon.attack))
            }
        }
    }
}
