// MARK: Main game logic

func startGame() {
    // Test calls for basic messages as of right now
    welcomeMessage()
    //gameOverMessage()
    
    
    print()
    print()
    print()
    print()
    
    
  
    let pokemons = PokeFactory.allPokemon()
    for pokemon in pokemons {
        let id = pokemon.id
        let name = pokemon.name
        let type = pokemon.type.map { $0.rawValue }.joined(separator: "/")
        let maxHP = pokemon.maxHP
        let attack = pokemon.attack
        let catchDifficulty = pokemon.catchDifficulty
        print("\(id): \(name), \(type), \(maxHP), \(attack), \(catchDifficulty)")
    }
    
    
    
    
    
    
    print()
    print()
    print()
    print()
}
