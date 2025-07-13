// MARK: Application Entry Point

let starter = PokeFactory.allPokemon()[0]   // dummy starter
GameCoordinator(starter: starter).run()

// TODO: Remove the dummy data and implement proper data handling at the start of the game
// TODO: As soon as the save functionality fix the bug that, when you exit to the main menu the cuaght pokemon stay the same if you start a new game -> Solution could be saving the current caught Pokemon and then clearing them.
// TODO: Escape Service
// TODO: Encounter State
// TODO: Rest of the pokemon Ascii arts
// TODO: Game Over State
// TODO: Debugging Cheat Code to get to the Game Over State
// TODO: Save functionality
// TODO: Run inside terminal functionality
// TODO: Test coverage
