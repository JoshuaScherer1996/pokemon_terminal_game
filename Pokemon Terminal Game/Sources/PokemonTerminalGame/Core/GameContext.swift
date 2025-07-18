// MARK: Game Context class

/// Shared game data accessible across all game states.
final class GameContext {
    /// The currently selected Pokemon.
    var currentPokemon: Pokemon?
    /// The player's Pokedex with all caught Pokemon.
    var pokedex: PokedexManager
    
    /// Creates a new game context with a starter Pokemon.
    ///
    /// - Parameter starter: The Pokemon chosen at the beginning of the game. Default Wert ist nil, da der Starter erst später gewählt wird.
    init(starter: Pokemon? = nil) {
        self.currentPokemon = starter
        self.pokedex = PokedexManager(starter: starter)
    }
}


