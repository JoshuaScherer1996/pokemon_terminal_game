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
                handleMainMenuMessage()
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
                print()
            case .gameOver:
                // TODO: Implement my logic with a handler function
                print()
            case .saveAndExit:
                // TODO: Implement my logic with a handler function
                handleSaveAndExit()
                // just a quick exit from the run to test the flow. Gonna be removed later on.
                isRunning = false
            case .exit:
                isRunning = false
            }
        }
    }
    
    // MARK: - State Handler Functions

    /// Displays the welcome ASCII splash and welcome message,
    /// then waits for the user to continue.
    private func handleWelcome() {
        print(AsciiArt.titleSplash)
        print(Messages.legalDisclaimer)
        print(Messages.welcome)
        handleWelcomeInput()
    }
    
    /// Waits for the user to press "n" to proceed from the welcome screen.
    /// Uses a trailing closure to safely modify `currentState`.
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
                    self?.currentState = .playMenu
                case "2":
                    self?.currentState = .pokedex
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
    
    /// Displays the main menu options.
    private func handleMainMenuMessage() {
        print(Messages.mainMenu)
    }
    
    private func handlePlayMenu() {
        
    }
    
    private func handlePokedex() {
        
    }
    
    private func handleCredits() {
        
    }
    
    private func handleSaveAndExit() {
        //TODO: Call save functions ones implemented
        print("Save function currently not available. Exiting...")
    }
}

// TODO: Take more time to rework the game state flow and handler funcs
