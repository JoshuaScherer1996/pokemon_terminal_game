// MARK: Game Coordinator

/// Manages the game flow using a stack-based state system.
final class GameCoordinator {
    
    /// The stack of game states managed by the coordinator.
    private var stack: [GameState]
    
    /// Shared game context accessible to all states.
    private let context: GameContext
    
    /// The terminal I/O handler used for input and output.
    private let io: TerminalIO
    
    /// Initializes the game coordinator with an optional entry state and I/O handler.
    ///
    /// - Parameters:
    ///   - io: Terminal I/O interface (defaults to `StdTerminalIO`).
    ///   - initialState: The first game state on the stack (defaults to `WelcomeState()`).
    init(io: TerminalIO = StdTerminalIO(), initialState: GameState = WelcomeState()) {
        self.context = GameContext()
        self.io      = io
        self.stack   = [initialState]
    }
    
    /// Starts the main game loop and manages state transitions.
    func run() {
        loop: while let current = stack.last {
            switch current.run(context: context, io: io) {
            case .stay:
                continue loop
            case .push(let next):
                stack.append(next)
            case .pop:
                stack.removeLast()
            case .end:
                break loop
            }
        }
    }
}
