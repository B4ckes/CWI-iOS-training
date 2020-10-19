//
//  UIImageView+LoadImage.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 18/10/20.
//

import UIKit
import Nuke

extension UIImageView {
    func loadImage(with url: String) {
        guard let url = URL(string: url) else { return }
        
        Nuke.loadImage(with: url, into: self)
    }
}
