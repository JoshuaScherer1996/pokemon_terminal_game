// MARK: New Game State

/// Handles the starter Pokemon selection at the beginning of a new game.
struct NewGameState: GameState {
    
    /// Runs the new game sequence and sets the chosen starter Pokemon.
    ///
    /// - Parameters:
    ///   - context: The shared game context to update the starter and Pokedex.
    ///   - io: The terminal input/output interface.
    /// - Returns: Exits the game for now.
    func run(context: GameContext, io: TerminalIO) -> StateTransition {
        io.print(Messages.choosePokemon)
        io.print(AsciiArt.bulbasaur)
        io.print(AsciiArt.charmander)
        io.print(AsciiArt.squirtle)
        io.print(AsciiArt.pikachu)

        let choice = io.waitFor(
            options: ["1", "2", "3", "4"],
            prompt: Messages.inputPromptNumbers
        )

        // Select starter based on the player input.
        let starters = PokeFactory.allPokemon()
        let starter: Pokemon

        switch choice {
        case "1":
            starter = starters.first(where: { $0.name == "Bulbasaur" })!
        case "2":
            starter = starters.first(where: { $0.name == "Charmander" })!
        case "3":
            starter = starters.first(where: { $0.name == "Squirtle" })!
        case "4":
            starter = starters.first(where: { $0.name == "Pikachu" })!
        default:
            return .stay
        }

        // Store the selected starter in the shared game context.
        context.currentPokemon = starter
        context.pokedex.gotCaught(starter)

        io.print(Messages.exit)
        return .end
    }
}
