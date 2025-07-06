// MARK: Controller for the game loop

/// Handles transitions and flow control between different game states.
final class GameController {
    
    /// The current active game state.
    private var currentState: GameStateDeprecated = .welcome
    
    /// Starts the game loop and handles the active state transitions with help of the handler functions.
    func run() {
        var isRunning = true
        
        while isRunning {
            switch currentState {
            case .welcome:
                handleWelcome()
            case .mainMenu:
                handleMainMenu()
            case .newGame:
                handleNewGame()
            case .continueGame:
                // TODO: Implement my logic with a handler function
                handleContinue()
                // just a quick exit from the run to test the flow. Gonna be removed later on.
                isRunning = false
            case .playMenu:
                // TODO: Implement my logic with a handler function
                print()
            case .pokedex:
                // TODO: Implement my logic with a handler function
                print()
            case .encounter:
                // TODO: Implement my logic with a handler function
                print()
            case .battle:
                // TODO: Implement my logic with a handler function
                print()
            case .credits:
                // TODO: Implement my logic with a handler function
                handleCredits()
                // just a quick exit from the run to test the flow. Gonna be removed later on.
                isRunning = false
            case .gameOver:
                // TODO: Implement my logic with a handler function
                print()
            case .saveAndExit:
                // TODO: Implement my logic with a handler function
                handleSaveAndExit()
                // just a quick exit from the run to test the flow. Gonna be removed later on.
                isRunning = false
            case .exit:
                print("Exiting the game for now...")
                isRunning = false
            }
        }
    }
    
    // MARK: - State Handler Functions

    
    /// Shows splash screen and disclaimer, then waits for user to continue.
    private func handleWelcome() {
        print(AsciiArt.titleSplash)
        print(Messages.legalDisclaimer)
        handleWelcomeInput()
    }
    
    /// Waits for "n" input to continue to main menu.
    private func handleWelcomeInput() {
        InputHandler.waitForInput("n", message: Messages.inputPromptNext) {
            // Using [weak self] avoids a retain cycle in case this closure
            // is unexpectedly retained beyond the lifecycle of the controller.
            [weak self] in
                self?.currentState = .mainMenu
        }
    }
    
    /// Displays the main menu and routes to the selected state.
    private func handleMainMenu() {
        handleMainMenuMessage()
        InputHandler.waitForOptions(["1", "2", "3", "4"], message: Messages.inputPromptNumbers) { [weak self] choice in
            switch choice {
                case "1":
                    self?.currentState = .newGame
                case "2":
                    self?.currentState = .continueGame
                case "3":
                    self?.currentState = .credits
                case "4":
                    self?.currentState = .saveAndExit
                default:
                    // Should never happen but implemented default case to adhere to clean code guidlines.
                    print("Invalid option.")
            }
        }
    }
    
    /// Prints main menu options.
    private func handleMainMenuMessage() {
        print(Messages.mainMenu)
    }
    
    /// Shows starter Pokemon and waits for selection.
    private func handleNewGame() {
        handleNewGameMessages()
        InputHandler.waitForOptions(["1", "2", "3", "4"], message: Messages.inputPromptNumbers) { [weak self] choice in
            switch choice {
                case "1":
                    self?.currentState = .exit
                case "2":
                    self?.currentState = .exit
                case "3":
                    self?.currentState = .exit
                case "4":
                    self?.currentState = .exit
                default:
                    // Should never happen but implemented default case to adhere to clean code guidlines.
                    print("Invalid option.")
            }
        }
    }
    
    /// Prints intro message and starter Pokemon with ASCII art.
    private func handleNewGameMessages() {
        print(Messages.greetings)
        print(Messages.choosePokemon)
        print(AsciiArt.bulbasaur)
        print(AsciiArt.charmander)
        print(AsciiArt.squirtle)
        print(AsciiArt.pikachu)
    }
    
    /// Placeholder for loading saved game.
    private func handleContinue() {
        print("Save functions currently not available. Exiting...")
    }
    
    /// Placeholder for credits screen.
    private func handleCredits() {
        print(Messages.credits)
    }
    
    /// Placeholder for saving game state and exiting.
    private func handleSaveAndExit() {
        //TODO: Call save functions ones implemented
        print("Save functions currently not available. Exiting...")
    }
}


// TODO: Need to solve God Object problem -> State pattern

// Notes for myself regarding what needs to be implemented next
// TODO: GameContext class -> Holds all shared game data and services that every game state can access.
// TODO: GameState protocol -> Defines a protocol that every game state (e.g. menus, battles, screens) implements.
// TODO: State transition Enum -> A simple enum that tells the GameCoordinator what should happen after a state is executed.
// TODO: Game Coordinator -> Cleanly separates what each state does from how the game moves forward. That logic lives in one central place (the coordinator).
// TODO: Terminal IO -> Manages the overall game loop and flow between different states.
