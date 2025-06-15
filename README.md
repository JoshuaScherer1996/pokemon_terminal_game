# Pokémon Terminal Game (Swift)

A minimal, text-based Pokémon game for the terminal – developed as a showcase project with a focus on test-driven development, modular architecture, and clean Swift code.

---

## Project Idea

This project is part of my Swift portfolio and demonstrates how to build a complete, logically structured game system using only terminal interaction in Swift. The goals were:

- Structuring game flow and systems modularly
- Applying Swift architectural principles (protocols, extensions, TDD, SRP)
- Creating a fun and simple example with real-world code structure

The code aims to show how even a text-based game can be broken down into small, testable, and maintainable modules.

---

## Features Implemented So Far

- [x] Data model for all 151 first-gen Pokémon (with type, HP, attack, catch difficulty)
- [x] `PokeFactory`: Factory to generate all Pokémon from raw arrays
- [x] `PokeParser`: Helper structure to parse type strings (e.g., "fire/flying")
- [x] Protocol-based extensions for:
  - `Battle` behavior: attacking, damage, fainting
  - `Capture` behavior: catch chance based on difficulty
- [x] Extensive unit tests with `XCTest`:
  - Battle and capture logic
  - Type parser logic
  - Factory creation with failure handling
- [x] Structured folder architecture (`Player`, `Game`, `UI`, `Utilities`, `Protocols`)
- [x] Charmander ASCII art displayed at game end

---

## Project Flow (Screenshots)

### 1. Main Menu & Game Start
![Start Menu Flowchart](/mnt/data/Screenshot%202025-06-09%20at%2019.08.02.png)

### 2. Ingame Menu & Actions
![Ingame Flowchart](/mnt/data/Screenshot%202025-06-09%20at%2019.08.39.png)

### 3. Encounter & Battle Logic
![Battle Flowchart](/mnt/data/Screenshot%202025-06-09%20at%2019.08.54.png)

---

## Planned Features (ToDo)

- Game start with starter Pokémon
- Ingame menu with Pokédex, Encounter, Edit Team, Save & Exit
- Encounter system with Catch / Attack / Escape / Switch mechanics
- Team editing and auto-fill logic
- Pokédex states (empty, partially filled, complete)
- ASCII-based end animation when all 151 are caught
- Local save/load system
- Replay mode after 100% completion with disabled catching
- Easy terminal-based startup (`swift run` or `./start.sh`)

---

## Technologies Used

- Swift 5+
- XCTest
- Xcode
- Trello for project management
- Markdown documentation & Flowchart design

---

## Getting Started (coming soon)

---

## © Legal Disclaimer

This project is **not affiliated with Nintendo, Game Freak, or The Pokémon Company** in any way. 
This project is a non-commercial fan-made portfolio piece. 
I do not own the rights to Pokémon. 
All rights to the Pokémon franchise, including characters, names, and assets, are the property of The Pokémon Company, Nintendo, Game Freak, and Creatures Inc.
This project is intended for **educational and demonstration purposes only**, as part of a private programming portfolio. It is not distributed or promoted commercially.