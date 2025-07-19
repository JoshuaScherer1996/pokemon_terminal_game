// MARK: SaveGame.swift

/// Represents the data stored to resume a game later.
struct SaveGame: Codable {
    let currentPokemonID: Int?
    let caughtIDs: [Int]
}
