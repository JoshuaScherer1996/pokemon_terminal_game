import Foundation

// MARK: SaveManager

/// Handles saving, loading, and deleting game data from disk.
struct SaveManager {
    
    /// Name of the save file.
    private static let fileName = "save.json"
    
    /// URL to the save file in the user's home directory.
    private static var saveURL: URL {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                fatalError("Could not locate user's document directory.")
            }
            return documentsURL.appendingPathComponent(fileName)
    }
    
    /// Saves the current game state to disk.
    ///
    /// - Parameter game: The game state to save.
    static func save(game: SaveGame) {
        do {
            let data = try JSONEncoder().encode(game)
            try data.write(to: saveURL)
        } catch {
            print("❌ Failed to save game: \(error)")
        }
    }

    /// Loads the saved game state from disk.
    ///
    /// - Returns: The saved game, or `nil` if loading failed.
    static func load() -> SaveGame? {
        do {
            let data = try Data(contentsOf: saveURL)
            return try JSONDecoder().decode(SaveGame.self, from: data)
        } catch {
            return nil
        }
    }

    /// Deletes the saved game file.
    static func clear() {
        try? FileManager.default.removeItem(at: saveURL)
    }
}
