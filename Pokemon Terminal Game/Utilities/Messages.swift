//MARK: Collection of messages

/// Displays the welcome message to the player.
func welcomeMessage() {
    print("""
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
        
        """)
}

/// Displays the game over message when the player finishes the game.
func gameOverMessage() {
    print("""
        
        **********************************************
        
        Congratulations!

        You’ve caught all 151 Pokémon and completed your Pokédex.

        You’ve proven yourself to be the best Trainer in your region! Now take good care of your Pokémon and get ready to face the next challenge in your life.
        
        ***********************************************
        **                                           **
        **         Thank you for Playing! <3         **
        **                                           **
        ***********************************************
        
        """)
    
    printCharmander()
}

/// Prints a Charmander ASCII art.
func printCharmander() {
    print("""
                         .-.,__
                         `.     `.  ,
                      .--'  .._,'"-' `.
                     .    .'         `'
                     `.   /          ,'
                       `  '--.   ,-"'
                        `"`   |  \\
                           -. \\ |
                            `--Y.'      ___.
                                 \\     L._, \\
                       _.,        `.   <  <\\                _
                     ,' '           `, `.   | \\            ( `
                  ../, `.            `  |    .\\`.           \\ \\_
                 ,' ,..  .           _.,'    ||\\l            )  '".
                , ,'   \\           ,'.-.`-._,'  |           .  _._`.
              ,' /      \\ \\        `' ' `--/   | \\          / /   ..\\
            .'  /        \\ .         |\\__ - _ ,'` `        / /     `.`.
            |  '          ..         `-...-"  |  `-'      / /        . `.
            | /           |L__           |    |          / /          `. `.
           , /            .   .          |    |         / /             ` `
          / /          ,. ,`._ `-_       |    |  _   ,-' /               ` \\
         / .           \\\"`_/. `-_ \\_,.  ,'    +-' `-'  _,        ..,-.    \\`.
        .  '         .-f    ,'   `    '.       \\__.---'     _   .'   '     \\ \\
        ' /          `.'    l     .' /          \\..      ,_|/   `.  ,'`     L`
        |'      _.-""` `.    \\ _,'  `            \\ `.___`.'"`-.  , |   |    | \\
        ||    ,'      `. `.   '       _,...._        `  |    `/ '  |   '     .|
        ||  ,'          `. ;.,.---' ,'       `.   `.. `-'  .-' /_ .'    ;_   ||
        || '              V      / /           `   | `   ,'   ,' '.    !  `. ||
        ||/            _,-------7 '              . |  `-'    l         /    `||
        . |          ,' .-   ,' ||               | .-.        `.      .'     ||
         `'        ,'    `".'    |               |    `.        '. -.'       `'
                  /      ,'      |               |,'    \\-.._,.'/'
                  .     /        .               .       \\    .''
                .`.    |         `.             /         :_,'.'
                  \\ `...\\   _     ,'-.        .'         /_.-'
                   `-.__ `,  `'   .  _.>----''.  _  __  /
                        .'        /"'          |  "'   '_
                       /_|.-'\\ ,".             '.'`__'-( \\
                         / ,"'\"\\,'               `/  `-.|"
        
        """)
}
