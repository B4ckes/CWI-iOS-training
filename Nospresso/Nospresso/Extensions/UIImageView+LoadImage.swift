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
        
        let options = ImageLoadingOptions(placeholder: UIImage(systemName: "photo"))
        
        Nuke.loadImage(with: url, options: options, into: self)
    }
}
