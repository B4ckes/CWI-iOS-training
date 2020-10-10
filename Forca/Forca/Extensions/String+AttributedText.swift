//
//  String+AttributedText.swift
//  Forca
//
//  Created by Lucas Eduardo Backes on 08/10/20.
//

import UIKit

public extension String {
    var spaced: NSMutableAttributedString {
        let spacementAttribute: [NSAttributedString.Key: Any] = [
            .kern: 12
        ]
        
        return NSMutableAttributedString(string: self, attributes: spacementAttribute)
    }
    
    var greenColor: NSMutableAttributedString {
        let greenAtribute: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.green
        ]
        
        return NSMutableAttributedString(string: self, attributes: greenAtribute)
    }
    
    var redColor: NSMutableAttributedString {
        let redAtribute: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red
        ]
        
        return NSMutableAttributedString(string: self, attributes: redAtribute)
    }
}

public extension NSMutableAttributedString {
    var spaced: NSMutableAttributedString {
        let copy = NSMutableAttributedString(attributedString: self)
        
        let spacementAttribute: [NSAttributedString.Key: Any] = [
            .kern: 12
        ]
        
        copy.addAttributes(spacementAttribute, range: NSMakeRange(0, self.length))
        
        return copy
    }
}
