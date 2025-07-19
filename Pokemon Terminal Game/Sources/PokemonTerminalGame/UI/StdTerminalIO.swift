// MARK: Standard Terminal Input/Output

/// Handles basic input and output via the terminal using Swift’s built-in functions.
struct StdTerminalIO: TerminalIO {
    
    
    /// Prints a line of text to the terminal.
    ///
    /// - Parameter text: The string to print.
    func print(_ text: String) {
        Swift.print(text)
    }
    
    /// Reads a line of user input from the terminal.
    ///
    /// - Returns: The entered string, or an empty string if input fails.
    func readLine() -> String {
        Swift.readLine() ?? ""
    }
}
