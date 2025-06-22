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
    
    /// Main menu options shown during the main menu state.
    static let mainMenu = """
       
       ----------------------------------
                   MAIN MENU
       ----------------------------------
       1. Start New Game
       2. Continue
       3. Credits
       4. Exit
       
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
    
    /// Informartion to the player if they haven't saved a game yet.
    static let noSave = "You currently have no save file."
    
    /// Prompts the player to choose an option based on the input.
    static let inputPromptNumbers = "Please enter a number between 1 and 4."
    
    /// Prompts the player to continue.
    static let inputPromptNext = "Please enter 'n' to continue..."
    
    static let legalDisclaimer = """
        ------------------------------------------------------------------------------------------
        © Legal Disclaimer
        
        This project is not affiliated with Nintendo, Game Freak, or The Pokémon Company in any way. 
        This project is a non-commercial fan-made portfolio piece. I do not own the rights to Pokémon. 
        All rights to the Pokémon franchise, including characters, names, and assets, are the property of The Pokémon Company, Nintendo, Game Freak, and Creatures Inc. 
        This project is intended for educational and demonstration purposes only, as part of a private programming portfolio. 
        It is not distributed or promoted commercially.
        ------------------------------------------------------------------------------------------
        """
}
