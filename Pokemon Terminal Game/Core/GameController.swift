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
        print(Messages.welcome)
        handleWelcomeInput()
    }
    
    private func handleWelcomeInput() {
        print(Messages.inputPromptNext)
        
        let input = readLine() ?? ""
        
        if input.lowercased() == "n" {
            currentState = GameState.mainMenu
        } else {
            print("Invalid input. Please try again.")
            handleWelcome()
        }
    }
    
    private func handleMainMenuMessage() {
        print(Messages.mainMenu)
        
    }

}

// TODO: Extract the input logic into a helper utility function
// TODO: Take more time to rework the game state flow and handler funcs
