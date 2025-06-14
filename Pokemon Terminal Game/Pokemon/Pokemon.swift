// MARK: Pokemon data model

// Model for the Pokemon objects with all necessary properties.
struct Pokemon {
    let id: String
    let name: String
    let type: [PokeType]
    
    let maxHP: Int
    var currentHP: Int
    
    let attack: Int
    
    let catchDifficulty: Int
    
    init(id: String, name: String, type: [PokeType], maxHP: Int, attack: Int, catchDifficulty: Int) {
        self.id = id
        self.name = name
        self.type = type
        self.maxHP = maxHP
        self.currentHP = maxHP
        self.attack = attack
        self.catchDifficulty = catchDifficulty
    }
}
