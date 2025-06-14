// MARK: Factory to create all Pokemon objects

/// A factory that builds all Polemon from the first generation (Kanto region).
struct PokeFactory {
    
    /// Creates a complete list of Pokemon based on the raw data.
    /// - Returns: An array of valid Pokemon.
    static func allPokemon() -> [Pokemon] {
        var pokedex: [Pokemon] = []
        
        for index in 0..<pokemonNames.count {
            guard
                let type = parseTypes(from: pokemonTypes[index])
            else {
                continue
            }
            
            let pokemon = Pokemon(
                id: pokemonNumbers[index],
                name: pokemonNames[index],
                type: type,
                maxHP: 20,
                attack: 10,
                catchDifficulty: 2
            )
            
            pokedex.append(pokemon)
        }
        
        return pokedex
    }
    
    /// Converts a type string like `"fire/flying"` into an array of `PokeType` enums.
    /// - Parameter string: A list of type names.
    /// - Returns: An oprional array of `PokeType`s, or `nil` if none are valid.
    private static func parseTypes(from string: String) -> [PokeType]? {
        let elements = string
            .split(separator: "/")
            .compactMap { PokeType(rawValue: String($0)) }
        
        return elements.isEmpty ? nil : elements
    }
}
