//
//  ViewController.swift
//  PokeGuesser
//
//  Created by Vinícius Couto on 30/07/21.
//

import UIKit

class GuesserViewController: UIViewController {
    @IBOutlet var image: UIImageView!

    var pokedex: Pokedex!
    @IBOutlet var nextPokemon: UIButton!

    var pokemon: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        pokedex = .init()
        image.image = UIImage(named: pokedex.pokemons[pokemon].imgName)
        nextPokemon.addTarget(self, action: #selector(nextPoke), for: .touchUpInside)
    }

    @objc func nextPoke(_: UIButton) {
        pokemon += 1
//        let pokemonImage = ?.withRenderingMode(.alwaysTemplate)
        image.image = UIImage(named: pokedex.pokemons[pokemon].imgName)!.withTintColor(UIColor.systemRed, renderingMode: .alwaysTemplate)
    }
}
