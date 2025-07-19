// MARK: Factory to create all Pokemon objects

/// A factory that builds all Polemon from the first generation (Kanto region).
struct PokeFactory {
    
    /// Creates a list of Pokemon using either default or injected custom data arrays.
    ///
    /// - Parameters:
    ///   - ids: A list of Pokedex numbers.
    ///   - names: A list of Pokemon names.
    ///   - types: A list of Pokemon type strings (e.g. "fire/flying").
    ///   - hps: A list of max HP values.
    ///   - attacks: A list of base attack values.
    ///   - difficulties: A list of catch difficulty values.
    ///   - sprites: A list of all ascii artworks.
    /// - Returns: An array of valid `Pokemon` instances.
    static func allPokemon(
        ids: [String] = pokedexIDs,
        names: [String] = names,
        types: [String] = types,
        hps: [Int] = hp,
        attacks: [Int] = attack,
        difficulties: [Int] = catchDifficulties,
        sprites: [String] = sprites
    ) -> [Pokemon] {
        var pokedex: [Pokemon] = []
        
        for index in 0..<names.count {
            guard let type = PokeParser.parseTypes(from: types[index]) else {
                continue
            }
            
            let pokemon = Pokemon(
                id: ids[index],
                name: names[index],
                type: type,
                maxHP: hps[index],
                attack: attacks[index],
                catchDifficulty: difficulties[index],
                sprite: sprites[index]
            )
            
            pokedex.append(pokemon)
        }
        
        return pokedex
    }
}
