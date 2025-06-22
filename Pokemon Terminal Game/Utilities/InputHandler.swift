// MARK: Helper util for inputs

/// Provides utility functions for structured terminal input.
enum InputHandler {
    
    /// Waits for a specific expected input (e.g., "n") and retries on error.
    ///
    /// - Parameters:
    ///   - expected: The expected string.
    ///   - message: Message shown before the input.
    ///   - onSuccess: Closure to run when expected input is received.
    static func waitForInput(_ expected: String, message: String, onSuccess: () -> Void) {
        print(message)
        let input = readLine() ?? ""
        if input.lowercased() == expected.lowercased() {
            onSuccess()
        } else {
            print("Invalid input. Please try again.\n")
            waitForInput(expected, message: message, onSuccess: onSuccess)
        }
    }

    /// Waits for integer input from the user and returns it.
    ///
    /// - Parameter message: Optional message to show before the input.
    /// - Returns: Validated Int or nil.
    static func getIntInput(message: String? = nil) -> Int? {
        if let message = message { print(message) }
        guard let input = readLine(), let number = Int(input) else {
            print("Invalid number. Please try again.\n")
            return nil
        }
        return number
    }

    /// Waits for one of multiple valid options (e.g., "1", "2", "3", etc.).
    ///
    /// - Parameters:
    ///   - options: The available options to choose from.
    ///   - message: Message shown before the input.
    ///   - onSuccess: Closure to run when a valid option is chosen.
    static func waitForOptions(_ options: [String], message: String, onSuccess: (String) -> Void) {
        print(message)
        let input = readLine()?.lowercased() ?? ""
        if options.contains(input) {
            onSuccess(input)
        } else {
            print("Invalid choice. Please try again.\n")
            waitForOptions(options, message: message, onSuccess: onSuccess)
        }
    }
}

