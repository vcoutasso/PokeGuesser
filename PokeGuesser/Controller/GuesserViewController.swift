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
        scoreLabel.text = "Score: \(game.score)/\(game.pokemonCount)"
        if let currentPokemon = game.currentPokemon {
            UIView.transition(with: view,
                              duration: Constants.pokemonTransitionDuration,
                              options: [.transitionCrossDissolve, .curveEaseInOut, .allowUserInteraction]) {
                self.image.image = UIImage(named: currentPokemon.imgName)
                self.image.setImageColor(color: UIColor(named: "pokeHidden")!)

                let options = self.game.getNameOptions()

                for idx in options.indices {
                    self.optionButtons[idx].setTitle(options[idx], for: .normal)
                }
            }
        } else {
            navigationController?.popViewController(animated: true)
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
            button.layer.backgroundColor = UIColor(named: "pokeYellow")?.cgColor
            button.layer.borderColor = UIColor(named: "pokeNavyBlue")?.cgColor
            button.layer.borderWidth = 1
            button.clipsToBounds = true
        }
        updateView()
    }

    @objc func guessName(_ sender: UIButton) {
        if let guess = sender.titleLabel?.text {
            let scored = game.guessName(guess)

            image.resetImageColor(animated: true, completion: updateView)
            game.nextPokemon()

            UIView.transition(with: sender,
                              duration: Constants.buttonAnimationDuration,
                              options: [.curveLinear, .allowUserInteraction]) {
                sender.backgroundColor = scored ? .green : .red
            } completion: { _ in
                UIView.transition(with: sender,
                                  duration: Constants.buttonAnimationDuration,
                                  options: [.curveLinear, .allowUserInteraction]) {
                    sender.layer.backgroundColor = UIColor(named: "pokeYellow")?.cgColor
                }
            }
        }
    }
}
