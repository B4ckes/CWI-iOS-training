//
//  Acessorie.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 13/10/20.
//

import Foundation

public struct Accessory: Decodable {
    let category: String
    let items: [AccessoryItem]
    
    enum CodingKeys: String, CodingKey {
        case category = "categoria"
        case items = "itens"
    }
}

struct AccessoryItem: Decodable {
    let id: Int
    let name: String
    let price: Double
    let image: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case price = "preco"
        case image = "imagem"
        case description = "descricao"
    }
}
