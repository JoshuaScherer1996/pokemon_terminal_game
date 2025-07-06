// MARK: Game Coordinator

/// Manages the game flow using a stack-based state system.
final class GameCoordinator {

    private var stack: [GameState]
    private let context: GameContext
    private let io: TerminalIO

    /// Initializes the game with a starter Pokemon and optional I/O handler.
    ///
    /// - Parameters:
    ///   - starter: The initial Pokemon to begin the game with.
    ///   - io: Terminal I/O interface (defaults to `StdTerminalIO`).
    init(starter: Pokemon, io: TerminalIO = StdTerminalIO()) {
        self.context = GameContext(starter: starter)
        self.io      = io
        self.stack   = [WelcomeState()] // Entry point
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
