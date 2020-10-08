//
//  UIViewController+Keyboard.swift
//  Forca
//
//  Created by Lucas Eduardo Backes on 07/10/20.
//

import UIKit

public extension UIViewController {
    func dispatchKeyboard() {
        view.endEditing(true)
    }
}
