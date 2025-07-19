// MARK: Save/Load Extension for GameContext

/// Adds save/load support to the `GameContext`.
extension GameContext {
    
    /// Converts the current context into a savable game model.
    func toSaveGame() -> SaveGame {
        let id = currentPokemon.flatMap { Int($0.id) }
        return SaveGame(currentPokemonID: id, caughtIDs: Array(pokedex.caughtIDs))
    }
    
    /// Applies a loaded save model to the current context.
    ///
    /// - Parameter save: The saved game state to apply.
    func apply(save: SaveGame) {
        let all = PokeFactory.allPokemon()
        if let id = save.currentPokemonID {
            self.currentPokemon = all.first(where: { Int($0.id) == id })
        }
        self.pokedex = PokedexManager(from: save.caughtIDs)
    }
    
    /// Clears the current game state by removing the selected Pokemon and resetting the Pokedex.
    func reset() {
        currentPokemon = nil
        pokedex = PokedexManager(from: [])
    }
}
