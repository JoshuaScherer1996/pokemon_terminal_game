// MARK: Main game logic

func startGame() {
    // Test calls for basic messages as of right now
    welcomeMessage()
    gameOverMessage()    
}

/// Displays the welcome message to the player.
func welcomeMessage() {
    print(Messages.welcome)
}

/// Displays the game over message when the player finishes the game.
func gameOverMessage() {
    print(Messages.fullDex)
    
    printCharmander()
}

/// Prints a Charmander ASCII art.
func printCharmander() {
    print(AsciiArt.charmanderBig)
}


// TODO: Implement the GameController for the flow here and replace the test calls.

