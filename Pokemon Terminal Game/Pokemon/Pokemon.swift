// MARK: Pokemon data model

struct Pokemon {
    let id: Int
    let name: String
    let type: [PokeType]
    
    let maxHP: Int
    var currentHp: Int
    
    let catchDifficulty: Int
    
    // Later on: Implementation of functions through protocols
}
