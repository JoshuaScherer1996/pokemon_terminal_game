// MARK: Pokemon Data Model

/// Model representing a single Pokemon with all its core properties.
struct Pokemon: Equatable {
    let id: String
    let name: String
    let type: [PokeType]
    
    let maxHP: Int
    var currentHP: Int
    
    let attack: Int
    
    let catchDifficulty: Int
    
    let sprite: String
    
    /// Custom initializer to set the hp based properties correctly.
    init(id: String, name: String, type: [PokeType], maxHP: Int, attack: Int, catchDifficulty: Int, sprite: String) {
        self.id = id
        self.name = name
        self.type = type
        self.maxHP = maxHP
        self.currentHP = maxHP // sets the currentHP to the maxHP in the init.
        self.attack = attack
        self.catchDifficulty = catchDifficulty
        self.sprite = sprite
    }
}
