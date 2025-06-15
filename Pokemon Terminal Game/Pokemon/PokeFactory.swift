// MARK: Factory to create all Pokemon objects

/// A factory that builds all Polemon from the first generation (Kanto region).
struct PokeFactory {
    
    /// Creates a list of Pokemon using either default or injected custom data arrays.
    ///
    /// - Parameters:
    ///   - numbers: A list of Pokedex numbers. Uses internal data by default.
    ///   - names: A list of Pokemon names. Uses internal data by default.
    ///   - types: A list of Pokemon type strings (e.g. "fire/flying"). Uses internal data by default.
    ///   - hp: A list of max HP values. Uses internal data by default.
    ///   - attack: A list of base attack values. Uses internal data by default.
    ///   - difficulty: A list of catch difficulty values. Uses internal data by default.
    /// - Returns: An array of valid `Pokemon` instances.
    static func allPokemon(
        numbers: [String] = pokemonNumbers,
        names: [String] = pokemonNames,
        types: [String] = pokemonTypes,
        hp: [Int] = pokemonHP,
        attack: [Int] = pokemonAttack,
        difficulty: [Int] = pokemonCatchDifficulty
    ) -> [Pokemon] {
        var pokedex: [Pokemon] = []
        
        for index in 0..<names.count {
            guard let type = parseTypes(from: types[index]) else {
                continue
            }
            
            let pokemon = Pokemon(
                id: numbers[index],
                name: names[index],
                type: type,
                maxHP: hp[index],
                attack: attack[index],
                catchDifficulty: difficulty[index]
            )
            
            pokedex.append(pokemon)
        }
        
        return pokedex
    }
    
    /// Converts a type string like `"fire/flying"` into an array of `PokeType` enums.
    ///
    /// - Parameter string: A type string (e.g. `"grass/poison"`).
    /// - Returns: An array of `PokeType`s, or `nil` if parsing fails.
    private static func parseTypes(from string: String) -> [PokeType]? {
        let elements = string
            .split(separator: "/")
            .compactMap { PokeType(rawValue: String($0)) }
        
        return elements.isEmpty ? nil : elements
    }
}
