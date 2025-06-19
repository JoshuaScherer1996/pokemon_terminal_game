// MARK: Raw Pokemon Data Arrays

/// String values representing the Pokedex numbers.
let pokemonNumbers: [String] = [
    "001", "002", "003", "004", "005", "006", "007", "008", "009", "010",
    "011", "012", "013", "014", "015", "016", "017", "018", "019", "020",
    "021", "022", "023", "024", "025", "026", "027", "028", "029", "030",
    "031", "032", "033", "034", "035", "036", "037", "038", "039", "040",
    "041", "042", "043", "044", "045", "046", "047", "048", "049", "050",
    "051", "052", "053", "054", "055", "056", "057", "058", "059", "060",
    "061", "062", "063", "064", "065", "066", "067", "068", "069", "070",
    "071", "072", "073", "074", "075", "076", "077", "078", "079", "080",
    "081", "082", "083", "084", "085", "086", "087", "088", "089", "090",
    "091", "092", "093", "094", "095", "096", "097", "098", "099", "100",
    "101", "102", "103", "104", "105", "106", "107", "108", "109", "110",
    "111", "112", "113", "114", "115", "116", "117", "118", "119", "120",
    "121", "122", "123", "124", "125", "126", "127", "128", "129", "130",
    "131", "132", "133", "134", "135", "136", "137", "138", "139", "140",
    "141", "142", "143", "144", "145", "146", "147", "148", "149", "150",
    "151"
]

/// English Pokemon names as strings.
let pokemonNames: [String] = [
    "Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard", "Squirtle", "Wartortle",
    "Blastoise", "Caterpie", "Metapod", "Butterfree", "Weedle", "Kakuna", "Beedrill", "Pidgey", "Pidgeotto",
    "Pidgeot", "Rattata", "Raticate", "Spearow", "Fearow", "Ekans", "Arbok", "Pikachu", "Raichu",
    "Sandshrew", "Sandslash", "Nidoran♀", "Nidorina", "Nidoqueen", "Nidoran♂", "Nidorino", "Nidoking",
    "Clefairy", "Clefable", "Vulpix", "Ninetales", "Jigglypuff", "Wigglytuff", "Zubat", "Golbat", "Oddish",
    "Gloom", "Vileplume", "Paras", "Parasect", "Venonat", "Venomoth", "Diglett", "Dugtrio", "Meowth", "Persian",
    "Psyduck", "Golduck", "Mankey", "Primeape", "Growlithe", "Arcanine", "Poliwag", "Poliwhirl", "Poliwrath", "Abra",
    "Kadabra", "Alakazam", "Machop", "Machoke", "Machamp", "Bellsprout", "Weepinbell", "Victreebel",
    "Tentacool", "Tentacruel", "Geodude", "Graveler", "Golem", "Ponyta", "Rapidash", "Slowpoke", "Slowbro",
    "Magnemite", "Magneton", "Farfetch’d", "Doduo", "Dodrio", "Seel", "Dewgong", "Grimer", "Muk",
    "Shellder", "Cloyster", "Gastly", "Haunter", "Gengar", "Onix", "Drowzee", "Hypno", "Krabby",
    "Kingler", "Voltorb", "Electrode", "Exeggcute", "Exeggutor", "Cubone", "Marowak", "Hitmonlee", "Hitmonchan",
    "Lickitung", "Koffing", "Weezing", "Rhyhorn", "Rhydon", "Chansey", "Tangela", "Kangaskhan", "Horsea",
    "Seadra", "Goldeen", "Seaking", "Staryu", "Starmie", "Mr. Mime", "Scyther", "Jynx", "Electabuzz",
    "Magmar", "Pinsir", "Tauros", "Magikarp", "Gyarados", "Lapras", "Ditto", "Eevee", "Vaporeon",
    "Jolteon", "Flareon", "Porygon", "Omanyte", "Omastar", "Kabuto", "Kabutops", "Aerodactyl",
    "Snorlax", "Articuno", "Zapdos", "Moltres", "Dratini", "Dragonair", "Dragonite", "Mewtwo", "Mew"
]

/// Type definitions in the format "fire/flying" or just "electric".
let pokemonTypes: [String] = [
    "grass/poison", "grass/poison", "grass/poison", "fire", "fire", "fire/flying", "water", "water",
    "water", "bug", "bug", "bug/flying", "bug/poison", "bug/poison", "bug/poison", "normal/flying",
    "normal/flying", "normal/flying", "normal", "normal", "normal/flying", "normal/flying", "poison", "poison",
    "electric", "electric", "ground", "ground", "poison", "poison", "poison/ground", "poison", "poison", "poison/ground",
    "fairy", "fairy", "fire", "fire", "normal/fairy", "normal/fairy", "poison/flying", "poison/flying",
    "grass/poison", "grass/poison", "grass/poison", "bug/grass", "bug/grass", "bug/poison",
    "bug/flying", "ground", "ground", "normal", "normal", "water", "water", "fighting", "fighting", "fire",
    "fire", "water", "water", "water/fighting", "psychic", "psychic", "psychic", "fighting", "fighting",
    "fighting", "grass", "grass", "grass", "water/poison", "water/poison", "rock/ground",
    "rock/ground", "rock/ground", "fire", "fire", "water/psychic", "water/psychic",
    "electric/steel", "electric/steel", "normal/flying", "normal/flying", "normal/flying",
    "water/ice", "water/ice", "poison", "poison", "water/ice", "water/ice", "ghost/poison", "ghost/poison",
    "ghost/poison", "rock/ground", "psychic", "psychic", "water", "water", "electric", "electric",
    "grass/psychic", "grass/psychic", "ground", "ground", "fighting", "fighting", "normal", "poison", "poison",
    "ground/rock", "ground/rock", "normal", "grass", "normal", "water", "water", "water",
    "water", "water", "water/psychic", "psychic", "bug/flying", "ice/psychic", "electric", "fire",
    "bug", "normal", "water", "water/flying", "water/ice", "normal", "normal", "water", "water",
    "water", "normal", "rock/water", "rock/water", "rock/water", "rock/water",
    "rock/flying", "normal", "ice/flying", "electric/flying", "fire/flying", "dragon", "dragon",
    "dragon/flying", "psychic", "psychic"
]

/// Default health point (HP) values as Integers.
let pokemonHP: [Int] = [
    45, 60, 80, 39, 58, 83, 44, 62, 79, 45, 50, 60, 40, 45, 65, 40, 63, 78, 30, 55,
    40, 65, 35, 60, 50, 60, 50, 75, 55, 70, 90, 46, 61, 81, 70, 95, 38, 73, 115,
    140, 40, 75, 45, 60, 75, 35, 60, 60, 50, 10, 35, 40, 65, 50, 80, 40, 55, 55, 90,
    40, 65, 100, 25, 40, 55, 70, 80, 50, 65, 80, 40, 60, 80, 40, 55, 90, 180, 25,
    50, 75, 40, 65, 52, 35, 60, 30, 55, 60, 45, 60, 40, 65, 60, 35, 60, 80, 45, 70,
    60, 85, 40, 60, 70, 50, 65, 105, 65, 105, 20, 95, 130, 48, 60, 130, 65, 110, 65,
    80, 100, 30, 50, 30, 60, 80, 90, 91, 106, 100, 65, 65, 65, 35, 55, 30, 55, 80,
    160, 90, 90, 90, 41, 61, 91, 106, 100, 106, 100, 106, 100, 106, 100
]

/// Default attack values as Integers.
let pokemonAttack: [Int] = [
    49, 62, 82, 52, 64, 84, 48, 63, 83, 30, 20, 45, 35, 25, 90, 45, 60, 80, 56, 81,
    60, 90, 60, 85, 55, 90, 75, 100, 47, 62, 92, 57, 72, 102, 45, 70, 41, 76, 45,
    80, 45, 80, 50, 65, 80, 70, 95, 90, 55, 85, 35, 70, 60, 82, 100, 70, 100, 70,
    110, 50, 65, 85, 20, 35, 50, 80, 100, 80, 95, 120, 40, 65, 85, 80, 100, 110, 85,
    45, 75, 100, 35, 60, 65, 85, 110, 45, 70, 110, 105, 130, 40, 65, 80, 50, 95, 30,
    60, 90, 105, 130, 30, 50, 80, 40, 60, 85, 90, 110, 50, 75, 95, 35, 55, 65, 95,
    125, 60, 80, 100, 120, 110, 130, 70, 90, 110, 55, 65, 75, 80, 105, 130, 85, 95,
    85, 105, 134, 85, 85, 110, 170, 150, 170, 150, 170, 150, 170, 150, 170, 150, 170, 150
]

/// Default values for the catch difficulty as Integers.
let pokemonCatchDifficulty: [Int] = [
    30, 60, 120, 30, 60, 200, 30, 60, 120, 20, 25, 40, 20, 25, 60, 30, 80, 120, 40, 80,
    50, 100, 70, 100, 40, 80, 60, 90, 80, 90, 130, 80, 90, 140, 50, 80, 60, 110, 40, 100,
    60, 100, 40, 80, 110, 70, 110, 60, 90, 30, 90, 40, 100, 50, 90, 60, 70, 150, 50, 80,
    140, 200, 180, 220, 70, 100, 160, 60, 90, 130, 70, 90, 60, 90, 130, 80, 140, 70, 110,
    60, 100, 60, 90, 80, 130, 90, 120, 50, 100, 50, 90, 40, 90, 40, 90, 40, 150, 80, 120,
    50, 110, 80, 90, 120, 110, 130, 130, 130, 140, 140, 180, 60, 130, 140, 160, 120, 180,
    60, 80, 100, 90, 110, 120, 100, 140, 150, 150, 170, 10, 180, 120, 90, 90, 110, 130,
    150, 160, 160, 200, 5, 250, 250, 250, 80, 90, 220, 250, 250, 220, 250, 250
]
