//
//  Capsule.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 13/10/20.
//

import Foundation

public struct Capsule: Decodable {
    let category: String
    let coffees: [Coffee]
    
    enum CodingKeys: String, CodingKey {
        case category = "categoria"
        case coffees = "cafes"
    }
}
