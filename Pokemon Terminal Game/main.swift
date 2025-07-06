// MARK: Application Entry Point

/// Entry point that starts the game logic.
//startGame()


//let controller = GameController()
//controller.run()

let pokedex = PokedexManager(starter: Pokemon(id: "001", name: "Bulbasaur", type: [.grass, .poison], maxHP: 45, attack: 49, catchDifficulty: 30))

let entries = pokedex.showEntries()

print(entries)
