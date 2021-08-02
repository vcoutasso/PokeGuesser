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
    @IBOutlet var scoreLabel: UILabel!

    var game: GuessingGame!

    var pokemon: Int = 0

    private func updateView() {
        if let currentPokemon = game.currentPokemon {
            image.image = UIImage(named: currentPokemon.imgName)
            image.setImageColor(color: .darkGray)

            let options = game.getNameOptions()

            for idx in options.indices {
                optionButtons[idx].setTitle(options[idx], for: .normal)
            }

            scoreLabel.text = "Score: \(game.score)"
        } else {
            // TODO: GAME OVER
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
            image.resetImageColor(animated: true, completion: updateView)
            game.nextPokemon()
        }
    }
}
