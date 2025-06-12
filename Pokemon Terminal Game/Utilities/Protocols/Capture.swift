// MARK: Capture Protocol

// Protocol ensures that the necessary properties and methods will be implemented for our objects.
protocol Capture {
    var catchDifficulty: Int { get }
    
    func catchChance() -> Double
}
