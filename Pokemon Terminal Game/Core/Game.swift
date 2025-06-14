// MARK: Main game logic

func startGame() {
    // Test calls for basic messages as of right now
    welcomeMessage()
    //gameOverMessage()
    let pokemons: [Pokemon] = PokeFactory.allPokemon()
    for pokemon in pokemons {
        print(pokemon.id)
    }
}
