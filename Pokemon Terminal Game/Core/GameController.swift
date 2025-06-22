// MARK: Controller for the game loop

/// Handles transitions and flow control between different game states.
final class GameController {
    
    /// The current active game state.
    private var currentState: GameState = .welcome
    
    /// Starts the game loop and handles the active state transitions.
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
                print()
            case .exit:
                isRunning = false
            }
        }
    }
    
    // MARK: - State Handler Functions

    private func handleWelcome() {
        print(AsciiArt.titleSplash)
        print(Messages.welcome)
        handleWelcomeInput()
    }
    
    private func handleWelcomeInput() {
        InputHandler.waitForInput("n", message: Messages.inputPromptNext) {
            [weak self] in
                self?.currentState = .mainMenu
        }
    }
    
    private func handleMainMenuMessage() {
        print(Messages.mainMenu)
    }
}

// TODO: Take more time to rework the game state flow and handler funcs
