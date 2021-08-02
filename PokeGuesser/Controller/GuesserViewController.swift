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

    private func updateView() {
        if let currentPokemon = game.currentPokemon {
            image.image = UIImage(named: currentPokemon.imgName)
            image.setImageColor(color: #colorLiteral(red: 0, green: 0.07427774821, blue: 0.1634875211, alpha: 0.9029782529))

            let options = game.getNameOptions()

            for idx in options.indices {
                optionButtons[idx].setTitle(options[idx], for: .normal)
            }

            scoreLabel.text = "Score: \(game.score)/\(game.pokemonCount)"
        } else {
            // TODO: GAME OVER
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        game = GuessingGame()
        for button in optionButtons {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(guessName), for: .touchUpInside)
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.numberOfLines = 1
            button.layer.cornerRadius = Constants.buttonCornerRadius
            button.layer.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            button.clipsToBounds = true
        }
        updateView()
    }

    @objc func guessName(_ sender: UIButton) {
        if let guess = sender.titleLabel?.text {
            game.guessName(guess)
            image.resetImageColor(animated: true, completion: updateView)
            game.nextPokemon()
        }
    }
}
