//
//  Extensions.swift
//  PokeGuesser
//
//  Created by Vinícius Couto on 01/08/21.
//

import UIKit

extension UIImageView {
    func setImageColor(color: UIColor) {
        image = image?.withRenderingMode(.alwaysTemplate)
        tintColor = color
    }

    func resetImageColor(animated: Bool, completion: @escaping () -> Void) {
        if animated {
            UIView.transition(with: self,
                              duration: Constants.animationFadeDuration,
                              options: .transitionCrossDissolve) {
                self.image = self.image?.withRenderingMode(.alwaysOriginal)
            } completion: { _ in
                completion()
            }
        } else {
            image = image?.withRenderingMode(.alwaysOriginal)
        }
    }
}
