//
//  String+AttributedText.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 22/10/20.
//

import UIKit

public extension String {
    var whiteColored: NSMutableAttributedString {
        let whiteAttribute: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        
        return NSMutableAttributedString(string: self, attributes: whiteAttribute)
    }
}
