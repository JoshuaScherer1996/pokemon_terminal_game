// MARK: Collection of messages

/// A container for static text messages shown during the game.
/// Provides centralized and cleanly separated message strings.
enum Messages {
    
    /// Message shown at the start of the game.
    static let welcome = """
        ***********************************************
        **                                           **
        **   Welcome to the Pokémon Terminal Game!   **
        **                                           **
        ***********************************************
        
        Hello Trainer!
        
        Your mission in this game is to catch all 151 Pokémon from the first generation and complete your Pokédex.
        
        Get ready for an exciting adventure as you discover a variety of Pokémon to catch.
        
        Each Pokémon has varying levels of difficulty to catch. Be prepared to prove your skills as a Pokémon Trainer and become the very best!
        
        Have fun and good luck on your journey!
        
        """
    
    /// Message shown after completing the full Pokedex.
    static let fullDex = """
        
        **********************************************
        
        Congratulations!

        You’ve caught all 151 Pokémon and completed your Pokédex.

        You’ve proven yourself to be the best Trainer in your region! Now take good care of your Pokémon and get ready to face the next challenge in your life.
        
        ***********************************************
        **                                           **
        **         Thank you for Playing! <3         **
        **                                           **
        ***********************************************
        
        """
}
