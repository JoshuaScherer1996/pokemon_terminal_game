// MARK: Default TerminalIO Behaviors

// Protcol extension that implements the helper functions.
extension TerminalIO {

    /// Waits until the user inputs the expected string (case-insensitive).
    ///
    /// - Parameters:
    ///   - expected: The required input to proceed.
    ///   - prompt: The message shown to the user before input.
    func waitFor(_ expected: String, prompt: String) {
        print(prompt)
        while readLine().lowercased() != expected.lowercased() {
            print("Invalid input. Try again:")
        }
    }

    /// Waits until the user selects a valid option from the given list (case-insensitive).
    ///
    /// - Parameters:
    ///   - options: A list of valid input strings.
    ///   - prompt: The message shown to the user before input.
    /// - Returns: The valid user input.
    func waitFor(options: [String], prompt: String) -> String {
        print(prompt)
        var input = readLine().lowercased()
        while !options.contains(input) {
            print("Invalid choice. Try again:")
            input = readLine().lowercased()
        }
        return input
    }
}
