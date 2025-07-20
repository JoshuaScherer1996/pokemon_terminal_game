// MARK: Encounter Service

/// A service responsible for handling wild Pokemon encounters.
final class EncounterService {
    
    /// The complete list of all available Pokemon in the game.
    private let allPokemon: [Pokemon]
    
    /// Main initializer for production use.
        init() {
            self.allPokemon = PokeFactory.allPokemon()
        }

        /// Convenience initializer for test use.
        init(pokedex: [Pokemon]) {
            self.allPokemon = pokedex
        }
    

    /// Returns a random Pokemon that has not yet been caught by the player.
    ///
    /// - Parameter pokedex: The player's current `PokedexManager` used to identify caught Pokemon.
    /// - Returns: A random uncaught `Pokemon` instance, or `nil` if all Pokemon have been caught.
    func getRandomUncaughtPokemon(using pokedex: PokedexManager) -> Pokemon? {
        let uncaught = allPokemon.filter {
            !pokedex.caughtIDs.contains(Int($0.id) ?? 0)
        }
        return uncaught.randomElement()
    }
    
    
    /// Returns a random Pokemon from the full list (used for testing or demo purposes).
    ///
    /// - Returns: A random `Pokemon` from the internal list, or `nil` if the list is empty.
    func randomEncounter() -> Pokemon? {
        return allPokemon.randomElement()
    }
}
