// MARK: Collection of messages

/// A container for static text messages shown during the game.
/// Provides centralized and cleanly separated message strings.
enum Messages {
    
    /// Message shown at the start of the game.
    static let greetings = """
        
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
    
    /// Play menu options shown during the play menu state.
    static let playMenu = """
       
       ----------------------------------
                   PLAY MENU
       ----------------------------------
       1. Encounter wild Pokémon
       2. Change your active Pokémon
       3. View Pokédex
       4. Return to Main Menu       
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
    static let noSave = "\nYou currently have no save file."
    
    /// Prompts the player to choose an option based on the input.
    static let inputPromptNumbers = "\nPlease enter a number between 1 and 4."
    
    /// Prompts the player to continue.
    static let inputPromptNext = "\nPlease enter 'n' to continue..."
    
    /// Legal disclaimer to display transparently who owns what.
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
    
    /// Prompts the player to choose a Pokemon.
    static let choosePokemon = """
        
        Oh! I almost forgot! You should never start your journey without a Pokémon by your side.
        
        Lucky for you, the creator of this game decided to gift you a starter Pokémon.
        
        The Pokémon you choose now will accompany you throughout your entire journey. Some might even say it’s the most important decision of your life!
        
        So... Who will it be?
        """
    /// Information about the development.
    static let credits = """
    
        ***********************************************
        **                 CREDITS                   **
        ***********************************************
    
        Pokémon Terminal Game – Portfolio Showcase

        Developed by Joshua Scherer
        Built entirely in Swift as a CLI game

        Inspired by the original Pokémon games
        by Nintendo, Game Freak, and Creatures Inc.

        Special thanks to the creators of ASCII Pokémon art

        And last but not least: thank you, the player.  
        A game only comes to life through its players,  
        and the fact that you chose to start this journey  
        means the world to me.
    
        This is a fan-made project created for educational 
        and portfolio purposes only.
        All rights to Pokémon belong to their original creators.
        No copyright infringement intended.

        ***********************************************
        **         Thanks for playing! ❤️            **
        ***********************************************
    
    """
    
    /// Informartion to the player that they are now exiting the game
    static let exit = "\nExiting the Game. See ya around!\n"

    /// Title shown at the start of the pokedex state
    static let currentPokedex = "\nThis is your current Pokedex:\n"
}
