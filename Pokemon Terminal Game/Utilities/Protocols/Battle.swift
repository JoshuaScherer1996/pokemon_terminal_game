// MARK: Protocol Battle

// Protocol ensures that the necessary properties and methods will be implemented for our objects.
protocol Battle {
    var maxHP: Int { get }
    var currentHP: Int { get set}
    var attack: Int { get }
    var isFainted: Bool { get }
        
    mutating func takeDamage(_ amount: Int)
}
