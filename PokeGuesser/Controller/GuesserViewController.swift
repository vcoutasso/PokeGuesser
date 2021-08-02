//
//  ViewController.swift
//  PokeGuesser
//
//  Created by Vinícius Couto on 30/07/21.
//

import UIKit

class GuesserViewController: UIViewController {
    @IBOutlet var image: UIImageView!
    @IBOutlet var optionButtons: [UIButton]!

    var game: GuessingGame!

    var pokemon: Int = 0

    private func updateView() {
        image.image = UIImage(named: game.currentPokemon!.imgName)
        image.setImageColor(color: .red)
        let options = game.getNameOptions()
        for idx in options.indices {
            optionButtons[idx].setTitle(options[idx], for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        game = GuessingGame()
        for button in optionButtons {
            button.addTarget(self, action: #selector(guessName), for: .touchUpInside)
        }
        updateView()
    }

    @objc func guessName(_ sender: UIButton) {
        if let guess = sender.titleLabel?.text {
            print(game.guessName(guess))
            game.nextPokemon()
        }
        image.resetImageColor(animated: true, completion: updateView)
    }
}
