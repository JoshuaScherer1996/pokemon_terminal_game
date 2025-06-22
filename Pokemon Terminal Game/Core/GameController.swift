// MARK: Controller for the game loop

/// Handles transitions and flow control between different game states.
final class GameController {
    
    /// The current active game state.
    private var currentState: GameState = .welcome
    
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
                // just a quick exit from the run to test the flow. Gonna be removed later on.
                isRunning = false
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

    private func handleWelcome() {
        print(AsciiArt.titleSplash)
        print(Messages.legalDisclaimer)
        handleWelcomeInput()
    }
    
    private func handleWelcomeInput() {
        InputHandler.waitForInput("n", message: Messages.inputPromptNext) {
            // Using [weak self] avoids a retain cycle in case this closure
            // is unexpectedly retained beyond the lifecycle of the controller.
            [weak self] in
                self?.currentState = .mainMenu
        }
    }
    
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
    
    private func handleMainMenuMessage() {
        print(Messages.mainMenu)
    }
    
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
    
    private func handleNewGameMessages() {
        print(Messages.greetings)
        print(Messages.choosePokemon)
        print(AsciiArt.bulbasaur)
        print(AsciiArt.charmander)
        print(AsciiArt.squirtle)
        print(AsciiArt.pikachu)
    }
    
    private func handleContinue() {
        print("Save functions currently not available. Exiting...")
    }
    
    private func handleCredits() {
        print("Not implemented yet. Exiting...")
    }
    
    private func handleSaveAndExit() {
        //TODO: Call save functions ones implemented
        print("Save functions currently not available. Exiting...")
    }
}

// TODO: Take more time to rework the game state flow and handler funcs
