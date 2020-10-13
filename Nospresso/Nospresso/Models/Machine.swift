//
//  Machine.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 13/10/20.
//

import Foundation

public struct Machine: Decodable, CustomStringConvertible {
    public var description: String {name}
    
    let id: Int
    let name: String
    let price: Double
    let machineDescription: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case price = "preco"
        case machineDescription = "descricao"
        case image = "imagem"
    }
}

public typealias MachineList = [Machine]
