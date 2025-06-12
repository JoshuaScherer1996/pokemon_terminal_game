// MARK: Pokemon data model

// Model for the Pokemon objects with all necessary properties.
struct Pokemon {
    let id: Int
    let name: String
    let type: [PokeType]
    
    let maxHP: Int
    var currentHP: Int
    
    let attack: Int
    
    let catchDifficulty: Int
}
