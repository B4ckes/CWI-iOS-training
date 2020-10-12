//
//  ViewController+Button.swift
//  Memory-Game
//
//  Created by Lucas Eduardo Backes on 11/10/20.
//

import UIKit

public extension UIViewController {
    func enableButton(_ button: UIButton) {
        button.isUserInteractionEnabled = true
    }

    func disableButton(_ button: UIButton) {
        button.isUserInteractionEnabled = false
    }
}
