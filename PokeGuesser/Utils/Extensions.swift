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

    func resetImageColor(animated: Bool) {
        if animated {
            UIView.transition(with: self,
                              duration: Constants.animationFadeDuration,
                              options: .transitionCrossDissolve,
                              animations: { self.image = self.image?.withRenderingMode(.alwaysOriginal) },
                              completion: nil)
        } else {
            image = image?.withRenderingMode(.alwaysOriginal)
        }
    }
}
