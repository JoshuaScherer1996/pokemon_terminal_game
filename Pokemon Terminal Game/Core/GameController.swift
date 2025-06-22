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
                // TODO: Implement my logic with a handler function
                print()
            case .mainMenu:
                // TODO: Implement my logic with a handler function
                print()
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
        // TODO: Implement function
    }
    
    private func handleWelcomeInput() {
        // TODO: Implement function
    }
    
    private func handleMainMenuMessage() {
        // TODO: Implement function
    }

}

// TODO: Take more time to rework the game state flow and handler funcs
