//
//  CoffeeDetail+Protocols.swift
//  Nospresso
//
//  Created by Lucas Eduardo Backes on 20/10/20.
//

import Foundation

protocol CoffeeDetailsViewType {
    func showTitle(_ title: String)
    func renderData(from coffee: Coffee)
}

protocol CoffeeDetailsPresenterType {
    func screenLoaded()
}
