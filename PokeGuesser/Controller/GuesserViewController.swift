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
        image.setImageColor(color: .red)
        nextPokemon.addTarget(self, action: #selector(nextPoke), for: .touchUpInside)
    }

    @objc func nextPoke(_: UIButton) {
        image.resetImageColor(animated: true)
        pokemon += 1
//        image.image = UIImage(named: pokedex.pokemons[pokemon].imgName)
    }
}
