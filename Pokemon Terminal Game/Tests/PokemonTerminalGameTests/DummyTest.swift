@testable import PokemonTerminalGame
import XCTest

final class LinkTest: XCTestCase {
    func testLinkingWorks() {
        let p = Pokemon(id: "1", name: "Test", type: [.fire], maxHP: 1 , attack: 2, catchDifficulty: 3, sprite: "")
        XCTAssertEqual(p.name, "Test")
    }
}
