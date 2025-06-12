// MARK: Pokemon data model

// Model for the Pokemon objects with all necessary properties.
struct Pokemon {
    let id: Int
    let name: String
    let type: [PokeType]
    
    let maxHP: Int
    var currentHp: Int
    
    let catchDifficulty: Int
    
    // Later on: Implementation of functions through protocols
}
