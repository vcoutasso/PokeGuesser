//
//  GuessingGame.swift
//  PokeGuesser
//
//  Created by Vinícius Couto on 01/08/21.
//

import Foundation

struct GuessingGame {
    private let pokedex: Pokedex

    private var availablePokemons: [Pokemon]

    private(set) var currentPokemon: Pokemon?

    init() {
        pokedex = Pokedex()
        availablePokemons = pokedex.pokemons
        currentPokemon = availablePokemons.randomElement()
    }

    // MARK: - Public Functions

    func guessName(_ guess: String) -> Bool {
        currentPokemon?.name == guess ? true : false
    }

    func guessTypes(_ guess: [String]) -> Bool {
        guess.allSatisfy { currentPokemon?.types.contains($0) ?? false }
    }

    func guessNextEvolution(_ guess: String) -> Bool {
        if let evolutionName = currentPokemon?.evolutionaryLine[(currentPokemon?
                .evolutionaryLine
                .firstIndex(of: currentPokemon!.name))! + 1]
        {
            if evolutionName == guess {
                return true
            }
        }
        return false
    }

    func guessPreviousEvolution(_ guess: String) -> Bool {
        if let evolutionName = currentPokemon?.evolutionaryLine[(currentPokemon?
                .evolutionaryLine
                .firstIndex(of: currentPokemon!.name))! - 1]
        {
            if evolutionName == guess {
                return true
            }
        }
        return false
    }

    func getNameOptions(qty: Int = 4) -> [String] {
        if let currentName = currentPokemon?.name {
            var options: [String] = Array(pokedex.pokemons
                .filter { $0.name != currentName }
                .map { $0.name }
                .shuffled()
                .prefix(qty - 1))
            options.append(currentName)
            return options.shuffled()
        }
        return []
    }

    // TODO: Implement the remaining getOptions functions

    mutating func nextPokemon() {
        if let toBeRemoved = currentPokemon {
            availablePokemons.remove(at: availablePokemons.firstIndex(of: toBeRemoved)!)
            currentPokemon = availablePokemons.randomElement()
        }
    }
}
