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
    
    /// Battle menu options shown during the encounter state.
    static let battleMenu = """
       
       ----------------------------------
                  BATTLE MENU
       ----------------------------------
       1. Attack 
       2. Catch 
       3. Change active Pokémon
       4. Flee     
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
    
    /// Title shown at the start of the Pokedex state
    static let currentPokedex = "\nThis is your current Pokedex:\n"
    
    /// Title shown at the start of the change Pokemon state
    static let titleCaughtPokemon = "\nYour currently caught Pokémon are:\n"
    
    /// Message prompting the player to input the id / go back
    static let changePokemonInput = """
        
        Enter the ID of the Pokémon you'd like to switch to.
        Otherwise press 'n' to cancel and return to the last menu.
        
        """
    
    /// Informartion to the player that they are now navigating back to the main menu
    static let backToMainMenu = """
                
        Returning to Main Menu...
        """
    
    /// Informartion to the player that they are now navigating back to the play menu
    static let backToPlayMenu = """
                
        Returning to Play Menu...
        """
    
    /// Information for the player that they haven't selected a Pokemon
    static let noPokemonSelcted = "Error: No Pokémon currently selected."
    
    /// Info for the player if they made no changes and decided to go back to the play menu
    static let pokemonNotChanged = "\nNo changes were made. Returning to the last menu.\n"
    
    /// Information for the player about an invalid ID input
    static let invalidId = "Invalid choice. Please enter a valid ID or 'n' to cancel:"
    
    /// Information that the player alredy has the selected Pokemon with them
    static let alreadySelected = "\nYou already have this Pokémon with you. Please choose another one or press 'n' to cancel."
    
    /// Generates a message when a wild Pokemon appears during an encounter.
    ///
    /// - Parameter pokemon: The wild Pokemon that has appeared.
    /// - Returns: A formatted encounter message including the Pokemon's name and ASCII sprite.
    static func wildEncounterMessage(for pokemon: Pokemon) -> String {
        return """
    
    You go out into the wild and suddenly hear rustling in the tall grass...
    Something is moving—watch out!
    
    A wild \(pokemon.name) appeared!
    
    \(pokemon.sprite)
    
    Prepare for battle!
    """
    }
    
    /// Returns a message indicating which Pokemon the player currently has selected.
    ///
    /// - Parameter name: The name of the selected Pokemon.
    /// - Returns: A formatted message showing the current companion Pokemon.
    static func currentPokemon(_ name: String) -> String {
        return "\nCurrently you have \(name) by your side!\n"
    }
    
    /// Creates a formatted entry line for a Pokemon.
    ///
    /// - Parameters:
    ///   - marker: A prefix symbol or string to mark the entry.
    ///   - idString: The Pokemon's Pokedex ID.
    ///   - name: The Pokemon's name.
    ///   - type: The Pokemon's primary/secondary type(s).
    /// - Returns: A formatted string representing the entry.
    static func createEntry(marker: String, id idString: String, name: String, type: String) -> String {
        return "\(marker)ID: \(idString), Name: \(name), Type: \(type)"
    }
    
    /// Returns a message confirming a switch to a different Pokemon.
    ///
    /// - Parameter name: The name of the Pokemon that was switched to.
    /// - Returns: A confirmation message.
    static func switchedTo(_ name: String) -> String {
        return "\nSwitched to \(name)!"
    }
    
    /// Returns a message confirming the starter Pokemon selection.
    ///
    /// - Parameter name: The name of the chosen starter.
    /// - Returns: A confirmation message.
    static func chosenStarter(_ name: String) -> String {
        return "\nYou chose \(name)! A great choice!"
    }
    
    /// Returns a message describing the result of an attack during battle.
    ///
    /// - Parameters:
    ///   - attacker: The attacking Pokemon.
    ///   - target: The defending Pokemon that received damage.
    ///   - damage: The amount of damage dealt.
    /// - Returns: Formatted message showing the attack result and remaining HP of the target.
    static func attackResultMessage(attacker: Pokemon, target: Pokemon, damage: Int) -> String {
        return """
    
    \(attacker.name) attacked \(target.name) succesfully and dealt \(damage) damage!
    
    \(target.name) now has \(target.currentHP)/\(target.maxHP) HP remaining.
    """
    }
    
    /// Returns a message shown when the enemy Pokemon is defeated (fainted).
    ///
    /// - Parameter pokemon: The defeated enemy Pokemon.
    /// - Returns: Formatted message informing the player of the faint and possible missed opportunity.
    static func enemyDefeatedMessage(_ pokemon: Pokemon) -> String {
        return """
    
    \(pokemon.name) fainted.
    
    Next time be more careful if you want to catch it!
    """
    }
    
    /// Returns a message shown when the player's current Pokemon faints.
    ///
    /// - Parameter pokemon: The player's fainted Pokemon.
    /// - Returns: Formatted message indicating that the Pokemon has fainted.
    static func playerPokemonFaintedMessage(_ pokemon: Pokemon) -> String {
        return """
        
        Oh no!
        
        Your \(pokemon.name) has fainted!
        
        Let's escape from the battle and heal \(pokemon.name).
        """
    }
    
    /// Returns a message indicating that the enemy Pokemon is about to take its turn.
    ///
    /// - Parameters:
    ///   - name: The name of the enemy Pokemon.
    ///   - sprite: The ASCII art of the enemy Pokemon.
    /// - Returns: Formatted message announcing the start of the enemy turn.
    static func enemyTurn(of name: String, _ sprite: String) -> String {
        return """
            ------------------------------------------------------------------------------
            Your turn is over! Get ready for \(name)'s turn!
            
            \(sprite)
            
            \(name) looks at you pacing back and forth.
            ------------------------------------------------------------------------------
            """
    }
    
    /// Returns a message indicating that it's the player's turn, showing the current Pokemon.
    ///
    /// - Parameters:
    ///   - name: The name of the player's current Pokemon.
    ///   - sprite: The ASCII art of the player's Pokemon.
    /// - Returns: Formatted message announcing the start of the player's turn.
    static func playerTurn(with name: String, _ sprite: String) -> String {
        return """
            ------------------------------------------------------------------------------
            It's your turn!
            
            \(name) I choose you!
            
            \(sprite)
            ------------------------------------------------------------------------------
            """
    }
    
    /// Message displayed during a Pokemon capture attempt to create suspense and tension.
    ///
    /// - Parameter pokemon: The Pokemon being caught.
    /// - Returns: A dramatic multi-line string showing the catching process.
    static func catchingAttempt(_ pokemon: Pokemon) -> String {
        return """
        
        \(AsciiUIArt.throwWindUp)
        
        \(AsciiUIArt.flyingBall)
        
        You throw a Pokéball at \(pokemon.name)!
        
        The Pokéball flies through the air... 
        
        It hits \(pokemon.name) and pulls it inside!
        
        \(AsciiUIArt.pokeballSuction)
        
        The ball shakes once... 
        It shakes twice...
        It shakes a third time... 
        
        Will it stay shut...?
        """
    }
    
    /// Message displayed when the Pokemon is successfully caught.
    ///
    /// - Parameter pokemon: The caught Pokemon.
    /// - Returns: A celebratory message indicating a successful catch.
    static func catchSuccess(_ pokemon: Pokemon) -> String {
        return """
        
        *Click!* 
        
        Congratulations! You caught \(pokemon.name)! 
        
        \(pokemon.sprite)
        
        It has been added to your Pokédex.
        
        """
    }
    
    /// Message displayed when the capture attempt fails and the Pokemon breaks free.
    ///
    /// - Parameter pokemon: The Pokemon that escaped.
    /// - Returns: A dramatic message indicating failure.
    static func catchFailed(_ pokemon: Pokemon) -> String {
        return """
        
        Oh no! 
        
        \(pokemon.name) broke free!
        
        It looks at you with fiery determination...
        Prepare for another move!
        
        """
    }
}
