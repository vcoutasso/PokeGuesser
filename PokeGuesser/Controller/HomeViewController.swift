//
//  HomeViewController.swift
//  PokeGuesser
//
//  Created by Vinícius Couto on 02/08/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var newGame: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.attributedText = NSAttributedString(string: "PokeGuesser", attributes: [
            .strokeColor: UIColor(named: "pokeNavyBlue")!,
            .foregroundColor: UIColor(named: "pokeYellow")!,
            .strokeWidth: -5.0,
            .font: UIFont(name: "PokemonSolidNormal", size: 56)!,
        ])

        newGame.translatesAutoresizingMaskIntoConstraints = false
        newGame.setTitle("New Game", for: .normal)
        newGame.titleLabel?.font = UIFont(name: "PokemonSolidNormal", size: 36)
    }
}
