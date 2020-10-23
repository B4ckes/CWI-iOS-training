//
//  Double+Currency.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 22/10/20.
//

import Foundation

public extension Double {
    var toCurrency: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.init(identifier: "pr-BR")
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
