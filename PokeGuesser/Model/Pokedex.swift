//
//  Pokedex.swift
//  PokeGuesser
//
//  Created by Vinícius Couto on 01/08/21.
//

import Foundation

struct Pokedex: Decodable {
    let pokemons: [Pokemon]

    init() {
        if let pokemons = Pokedex.loadPokedex() {
            self.pokemons = pokemons
        } else {
            pokemons = []
        }
    }

    // 1st gen pokedex lets gooo
    private static func loadPokedex(from fileName: String = "pokedex") -> [Pokemon]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Pokedex.self, from: data)
                return jsonData.pokemons
            } catch {
                print("Error loading pokedex data: \(error)")
            }
        }
        return nil
    }
}
