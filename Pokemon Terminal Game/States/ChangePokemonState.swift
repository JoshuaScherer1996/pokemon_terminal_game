// MARK: Change Pokemon State

/// Allows the player to switch their current Pokemon to another one they've already caught.
struct ChangePokemonState: GameState {
    
    /// Displays caught Pokemon and allows the player to select a new one or cancel.
    ///
    /// - Parameters:
    ///   - context: The shared game context holding current Pokemon and Pokedex.
    ///   - io: The terminal input/output interface.
    /// - Returns: `.pop` to return to the previous state (play menu).
    func run(context: GameContext, io: TerminalIO) -> StateTransition {
        
        io.print("\nCurrently you have \(context.currentPokemon!.name) by your side!\n")
        
        let caughtIDs = context.pokedex.caughtIDs
        let allPokemon = context.pokedex.showEntries()
        
        io.print(Messages.titleCaughtPokemon)
        
        // Shows only caught Pokemon
        for pokemon in allPokemon where caughtIDs.contains(pokemon.id) {
            let idString = String(format: "%03d", pokemon.id)   // 1 -> "001"
            io.print("ID: \(idString), Name: \(pokemon.name), Type: \(pokemon.type)")
        }
        
        io.print(Messages.changePokemonInput)
        
        var validSelection = false
        repeat {
            let input = io.readLine().lowercased()
            
            if input == "n" {
                io.print(Messages.pokemonNotChanged)
                return .pop
            }
            
            // Checks if the input ID is valid
            guard let idInt = Int(input), caughtIDs.contains(idInt),
                  let selected = PokeFactory.allPokemon().first(where: { Int($0.id) == idInt }) else {
                io.print(Messages.invalidId)
                continue
            }
            
            context.currentPokemon = selected
            io.print("\nSwitched to \(selected.name)!\n")
            validSelection = true
        } while !validSelection
        
        return .pop
    }
}
