import XCTest
@testable import PokemonTerminalGame

// MARK: Unit Tests for the ChangePokemonService

/// Unit tests for changing the currently selected Pokémon using the AAA pattern.
final class ChangePokemonServiceTests: XCTestCase {
    
    /// Mock TerminalIO to simulate user input and capture output.
    final class MockIO: TerminalIO {
        var printedMessages: [String] = []
        var inputs: [String]
        private var inputIndex = 0

        init(inputs: [String]) {
            self.inputs = inputs
        }

        func print(_ message: String) {
            printedMessages.append(message)
        }

        func readLine() -> String {
            guard inputIndex < inputs.count else { return "" }
            defer { inputIndex += 1 }
            return inputs[inputIndex]
        }
    }

    /// Should switch to a different caught Pokémon when valid input is provided.
    func testChangePokemonSuccessful() {
        // Arrange
        let bulbasaur = Pokemon(id: "001", name: "Bulbasaur", type: [.grass], maxHP: 45, attack: 49, catchDifficulty: 30, sprite: "")
        let charmander = Pokemon(id: "004", name: "Charmander", type: [.fire], maxHP: 39, attack: 52, catchDifficulty: 45, sprite: "")
        
        let io = MockIO(inputs: ["004"])
        let pokedex = PokedexManager(starter: nil)
        pokedex.gotCaught(bulbasaur)
        pokedex.gotCaught(charmander)

        let context = GameContext()
        context.pokedex = pokedex
        context.currentPokemon = bulbasaur

        let service = ChangePokemonService()

        // Act
        let result = service.changePokemon(in: context, using: io)

        // Assert
        XCTAssertTrue(result, "Expected Pokémon to be successfully changed.")
        XCTAssertEqual(context.currentPokemon?.id, "004", "Expected current Pokémon to be Charmander after switch.")
    }

    /// Should return false and keep the same Pokémon if the player cancels.
    func testChangePokemonCancelled() {
        // Arrange
        let bulbasaur = Pokemon(id: "001", name: "Bulbasaur", type: [.grass], maxHP: 45, attack: 49, catchDifficulty: 30, sprite: "")
        
        let io = MockIO(inputs: ["n"])
        let pokedex = PokedexManager(starter: nil)
        pokedex.gotCaught(bulbasaur)

        let context = GameContext()
        context.pokedex = pokedex
        context.currentPokemon = bulbasaur

        let service = ChangePokemonService()

        // Act
        let result = service.changePokemon(in: context, using: io)

        // Assert
        XCTAssertFalse(result, "Expected change to be cancelled.")
        XCTAssertEqual(context.currentPokemon?.id, "001", "Expected current Pokémon to remain Bulbasaur.")
    }

    /// Should handle invalid inputs and retry until a valid one is entered.
    func testInvalidInputFollowedByValid() {
        // Arrange
        let bulbasaur = Pokemon(id: "001", name: "Bulbasaur", type: [.grass], maxHP: 45, attack: 49, catchDifficulty: 30, sprite: "")
        let squirtle = Pokemon(id: "007", name: "Squirtle", type: [.water], maxHP: 44, attack: 48, catchDifficulty: 45, sprite: "")

        let io = MockIO(inputs: ["xyz", "007"])
        let pokedex = PokedexManager(starter: nil)
        pokedex.gotCaught(bulbasaur)
        pokedex.gotCaught(squirtle)

        let context = GameContext()
        context.pokedex = pokedex
        context.currentPokemon = bulbasaur

        let service = ChangePokemonService()

        // Act
        let result = service.changePokemon(in: context, using: io)

        // Assert
        XCTAssertTrue(result, "Expected valid Pokémon to be selected after invalid input.")
        XCTAssertEqual(context.currentPokemon?.id, "007", "Expected Squirtle to be selected as the new current Pokémon.")
    }

    /// Should return false and print warning if no current Pokémon is set.
    func testChangePokemonWithNoCurrentPokemon() {
        // Arrange
        let bulbasaur = Pokemon(id: "001", name: "Bulbasaur", type: [.grass], maxHP: 45, attack: 49, catchDifficulty: 30, sprite: "")
        let io = MockIO(inputs: [])
        let pokedex = PokedexManager(starter: nil)
        pokedex.gotCaught(bulbasaur)

        let context = GameContext()
        context.pokedex = pokedex
        context.currentPokemon = nil

        let service = ChangePokemonService()

        // Act
        let result = service.changePokemon(in: context, using: io)

        // Assert
        XCTAssertFalse(result, "Expected change to fail when no current Pokémon is set.")
    }

    /// Should not allow selecting the currently selected Pokémon again.
    func testSelectingSamePokemonRepeatedly() {
        // Arrange
        let bulbasaur = Pokemon(id: "001", name: "Bulbasaur", type: [.grass], maxHP: 45, attack: 49, catchDifficulty: 30, sprite: "")
        let io = MockIO(inputs: ["001", "n"])
        let pokedex = PokedexManager(starter: nil)
        pokedex.gotCaught(bulbasaur)

        let context = GameContext()
        context.pokedex = pokedex
        context.currentPokemon = bulbasaur

        let service = ChangePokemonService()

        // Act
        let result = service.changePokemon(in: context, using: io)

        // Assert
        XCTAssertFalse(result, "Expected change to be cancelled when trying to reselect same Pokémon.")
        XCTAssertEqual(context.currentPokemon?.id, "001", "Expected current Pokémon to remain unchanged after invalid selection.")
    }
}

