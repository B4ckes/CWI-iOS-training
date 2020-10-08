//
//  String+AttributedText.swift
//  Forca
//
//  Created by Lucas Eduardo Backes on 08/10/20.
//

import Foundation

public extension String {
    var spaced: NSMutableAttributedString {
        let spacementAttribute: [NSAttributedString.Key: Any] = [
            .kern: 12
        ]
        
        return NSMutableAttributedString(string: self, attributes: spacementAttribute)
    }
}
