// MARK: Encounter Service

/// A service responsible for handling wild Pokemon encounters.
final class EncounterService {
    
    /// The complete list of all available Pokemon in the game.
    private let allPokemon = PokeFactory.allPokemon()

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
}
