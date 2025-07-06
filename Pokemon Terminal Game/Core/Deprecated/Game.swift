// MARK: Main game logic

func startGame() {
    // Test calls for basic messages as of right now
    welcomeMessage()
    gameOverMessage()    
}

/// Displays the welcome message to the player.
func welcomeMessage() {
    print(Messages.greetings)
}

/// Displays the game over message when the player finishes the game.
func gameOverMessage() {
    print(Messages.fullDex)
    
    printCharizard()
}

/// Prints a Charmander ASCII art.
func printCharizard() {
    print(AsciiArt.Charizard)
}


// TODO: Implement the GameController for the flow here and replace the test calls.

