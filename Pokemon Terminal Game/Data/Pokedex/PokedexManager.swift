import Foundation

// MARK: Manager for tracking caught Pokémon in the Pokédex

/// A manager that tracks all available Pokemon and handles visibility based on which have been caught.
/// Used to build and display the Pokedex entries based on caught Pokemon IDs.
final class PokedexManager {
    /// A private list created with the factory containing all valid Pokemon from the first generation.
    private let allPokemon: [Pokemon] = PokeFactory.allPokemon()
    
    /// A set of Pokemon IDs (as String) representing all Pokemon caught by the player.
    private(set) var caughtIDs: Set<String> = []
    
    /// Initializes a new Pokedex manager instance with a starter Pokemon already marked as caught.
    ///
    /// - Parameter starter: The initially chosen starter Pokemon.
    init(starter: Pokemon) {
        caughtIDs.insert(starter.id)
    }
    
    /// Marks a given Pokemon as caught and adds its ID to the set.
    ///
    /// - Parameter pokemon: The `Pokemon` instance that has just been caught.
    func gotCaught(_ pokemon: Pokemon) {
        caughtIDs.insert(pokemon.id)
    }
    
    /// Returns all Pokedex entries, making only caught Pokemon visible.
    /// Uncaught Pokemon are shown with question marks as placeholder values.
    ///
    /// - Returns: An array of `PokedexEntry` objects, with actual data for caught Pokemon and placeholders for the rest.
    func showEntries() -> [PokedexEntry] {
            return allPokemon.map { pokemon in
                if caughtIDs.contains(pokemon.id) {
                    let typeString = pokemon.type
                        .map { $0.rawValue.capitalized }
                        .joined(separator: "/")
                    return PokedexEntry(
                        id: Int(pokemon.id) ?? 0,
                        name: pokemon.name,
                        type: typeString
                    )
                } else {
                    return PokedexEntry(
                        id: Int(pokemon.id) ?? 0,
                        name: "???",
                        type: "???"
                    )
                }
            }
        }
}
