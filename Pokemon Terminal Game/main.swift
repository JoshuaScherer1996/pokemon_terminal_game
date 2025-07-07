// MARK: Application Entry Point

let starter = PokeFactory.allPokemon()[0]   // dummy starter
GameCoordinator(starter: starter).run()

// TODO: Remove the dummy data and implement proper data handling at the start of the game
