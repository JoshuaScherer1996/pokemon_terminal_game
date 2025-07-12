// MARK: Change Pokemon Service

/// A service that handles changing the currently selected Pokemon from the player's list of caught Pokemon.
final class ChangePokemonService {
    
    /// Allows the player to select a different caught Pokemon and updates the current selection.
    ///
    /// - Parameters:
    ///   - context: The shared game context, including current Pokemon and Pokedex.
    ///   - io: Terminal interface for input and output.
    /// - Returns: `true` if a new Pokemon was selected, `false` if the action was cancelled or no change occurred.
    func changePokemon(in context: GameContext, using io: TerminalIO) -> Bool {
        guard let current = context.currentPokemon else {
            io.print("Error: No Pokémon currently selected.")
            return false
        }
        
        let currentID = Int(current.id) ?? 0
        let caughtIDs = context.pokedex.caughtIDs
        let allPokemon = context.pokedex.showEntries()
        
        io.print("\nCurrently you have \(current.name) by your side!\n")
        io.print(Messages.titleCaughtPokemon)
        
        // Print list of caught Pokemon
        for pokemon in allPokemon where caughtIDs.contains(pokemon.id) {
            let idString = String(format: "%03d", pokemon.id)
            let marker = (pokemon.id == currentID) ? "[CURRENT] -> " : ""
            io.print("\(marker)ID: \(idString), Name: \(pokemon.name), Type: \(pokemon.type)")
        }
        
        io.print(Messages.changePokemonInput)
        
        while true {
            let input = io.readLine().lowercased()
            
            if input == "n" {
                io.print(Messages.pokemonNotChanged)
                return false
            }
            
            if input == String(format: "%03d", currentID) || input == "\(currentID)" {
                io.print(Messages.alreadySelected)
                continue
            }
            
            guard let idInt = Int(input), caughtIDs.contains(idInt),
                  let selected = PokeFactory.allPokemon().first(where: { Int($0.id) == idInt }) else {
                io.print(Messages.invalidId)
                continue
            }
            
            context.currentPokemon = selected
            io.print("\nSwitched to \(selected.name)!")
            return true
        }
    }
}
