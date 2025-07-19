// MARK: Helper Function PokeParser

/// A utility func for parsing Pokemon-related string data into model values.
struct PokeParser {
    
    /// Converts a type string like `"fire/flying"` into an array of `PokeType` enums.
    ///
    /// - Parameter string: A type string (e.g. `"grass/poison"`).
    /// - Returns: An array of `PokeType`s, or `nil` if parsing fails.
    static func parseTypes(from string: String) -> [PokeType]? {
        let types = string
            .split(separator: "/")
            .compactMap { PokeType(rawValue: String($0)) }
        
        return types.isEmpty ? nil : types
    }
}
