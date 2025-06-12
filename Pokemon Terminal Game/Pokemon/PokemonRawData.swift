// MARK: Raw Data for the Pokemons

// Information about the pokedex numbers directly as string values.
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

// Information about the pokemon names directly as string values.
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

// Information about the pokemon types directly as string values.
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
