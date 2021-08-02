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
            UIView.transition(with: view,
                              duration: Constants.pokemonTransitionDuration,
                              options: [.transitionCrossDissolve, .curveEaseInOut]) {
                self.image.image = UIImage(named: currentPokemon.imgName)
                self.image.setImageColor(color: #colorLiteral(red: 0, green: 0.07427774821, blue: 0.1634875211, alpha: 0.9029782529))

                let options = self.game.getNameOptions()

                for idx in options.indices {
                    self.optionButtons[idx].setTitle(options[idx], for: .normal)
                }

                self.scoreLabel.text = "Score: \(self.game.score)/\(self.game.pokemonCount)"
            }
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
            let scored = game.guessName(guess)

            image.resetImageColor(animated: true, completion: updateView)
            game.nextPokemon()

            UIView.transition(with: sender, duration: Constants.buttonAnimationDuration, options: .curveLinear) {
                sender.backgroundColor = scored ? .green : .red
            } completion: { _ in
                UIView.transition(with: sender, duration: Constants.buttonAnimationDuration, options: .curveLinear) {
                    sender.layer.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
                }
            }
        }
    }
}
