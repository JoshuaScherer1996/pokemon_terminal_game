// MARK: Terminal IO Protocol

/// Defines basic input and output methods for terminal-based user interaction.
protocol TerminalIO {
    
    /// Prints text to the terminal.
    ///
    /// - Parameter text: The string to print.
    func print(_ text: String)
    
    /// Reads user input from the terminal.
    ///
    /// - Returns: The entered string.
    func readLine() -> String
}
