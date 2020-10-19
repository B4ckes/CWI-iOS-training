//
//  CoffeeItem.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 13/10/20.
//

import Foundation

public struct CoffeeItem: Decodable {
    public var description: String {name}
    
    let id: Int
    let name: String
    let coffeeDescription: String
    let price: Double
    let image: String
    let measures: [Measure]
    let intensity: Int?
    
    enum Measure: String, Decodable {
        case ristretto, espresso, lungo
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case coffeeDescription = "descricao"
        case intensity = "intensidade"
        case price = "precoUnitario"
        case image = "imagem"
        case measures = "medidas"
    }
}
