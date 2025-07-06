import Foundation

final class PokedexManager {
    private let allPokemon: [Pokemon] = PokeFactory.allPokemon()
    
    private(set) var caughtIDs: Set<String> = []
    
    init(starter: Pokemon) {
        caughtIDs.insert(starter.id)
    }
    
    func gotCaught(_ pokemon: Pokemon) {
        caughtIDs.insert(pokemon.id)
    }
    
    func showEntries() -> [PokedexEntry] {
            return allPokemon.map { pokemon in
                if caughtIDs.contains(pokemon.id) {
                    let typeString = pokemon.type
                        .map { $0.rawValue.capitalized }
                        .joined(separator: "/")
                    return PokedexEntry(
                        id: Int(pokemon.id) ?? 0,
                        name: pokemon.name,
                        type: typeString
                    )
                } else {
                    return PokedexEntry(
                        id: Int(pokemon.id) ?? 0,
                        name: "???",
                        type: "???"
                    )
                }
            }
        }
}
