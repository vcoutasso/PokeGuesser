//
//  Pokemon.swift
//  PokeGuesser
//
//  Created by Vinícius Couto on 01/08/21.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let types: [String]
    let evolutionaryLine: [String]
    let imgName: String
}
