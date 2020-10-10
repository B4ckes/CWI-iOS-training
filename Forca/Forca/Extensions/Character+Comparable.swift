//
//  Character+Comparable.swift
//  Forca
//
//  Created by Lucas Eduardo Backes on 10/10/20.
//

import Foundation

extension Character {
    var comparable: String {
        self.uppercased().folding(options: .diacriticInsensitive, locale: .current)
    }
}
