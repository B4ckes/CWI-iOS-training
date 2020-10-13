//
//  Endpoint.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 13/10/20.
//

import Foundation

enum Endpoint {
    case acessorios
    case capsulas
    case cafe(id: Int)
    case maquinas
    
    var url: String {
        switch self {
        case .cafe(let id):
            return "cafes/\(id)"
        default:
            return "\(self)"
        }
    }
}
