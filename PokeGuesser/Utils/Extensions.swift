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

    func resetImageColor() {
        image = image?.withRenderingMode(.alwaysOriginal)
    }
}
